//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 < 0.9.0;
contract VotingContract{
    struct Voter{
        string name;
        uint age;
        uint voterID;
        string gender;
        uint voteCandidateID;
        address voterAddress;
    }

    struct Candidate{
        string name;
        uint age;
        string party;
        uint candidateID;
        string gender;
        address candidateAddress;
        uint votes; 
    }

    // Candidate registration variables
    uint candidate_Registraion_Start;
    uint candidate_Registraion_End;
    bool candidate_Registration_Time = false;
    
    // Voter registration variable
    uint voter_Registraion_Start;
    uint voter_Registraion_End;
    bool voter_Registration_Time = false;
    
    uint voting_Conduction_Start;
    uint voting_Conduction_End;
    bool votingConductionTime = false;

    // Important mappings
    mapping(uint=>Candidate) public CandidateDetails;
    mapping(uint=>Voter) public VoterDetails;

    // Election Commsission 
    address ElectionComission;

    // Winner
    address public winner;

    // Voter ID's
    uint nextVoterID = 1;

    // Candidate regestration ID's
    uint nextCandidateID = 1;

    // Emergency voting stop
    bool stopVoting = false;

    constructor(){
        ElectionComission = msg.sender;
        VoterDetails[nextVoterID] = Voter("EC", 20, nextVoterID, "Male", 0, ElectionComission);
        nextVoterID++;
    }

    modifier onlyElectionComission() {
        require(msg.sender == ElectionComission, "You are not from election comission");
        _;
    }
    modifier candidateRegistrationPhase() {
        candidateRegistrationPhaseStatus();
        require(candidate_Registration_Time == true, "Candidate Registration is closed");
        require(votingConductionTime==false, "Voting is ongoing");
        _;
    }
    modifier  voterRegistrationPhase() {
        voterRegistrationPhaseStatus();
        require(voter_Registration_Time == true, "Voter registration is closed");
        require(votingConductionTime==false, "Voting is ongoing");
        _;
    }

    modifier votingConductionPhase(){
        votingPhaseStatus();
        require(votingConductionTime == true, "voting  is closed");
        _;
    }
    
    // Candidate Panal

    // Candidate Register

    function candidateRegister(
        string calldata _name,
        uint _age,
        string memory _party,
        string memory _gender
    ) public candidateRegistrationPhase() {
        require(msg.sender != ElectionComission, "You are from election comission");
        require(_age >= 18, "Youa are under age");
        require(candidateVerification(msg.sender) == true, "Already registerd");
        CandidateDetails[nextCandidateID] = Candidate(_name, 
        _age, 
        _party, 
        nextCandidateID, 
        _gender,
        msg.sender,
        0 );
        nextCandidateID++;
        VoterDetails[nextVoterID] = Voter(_name, _age, nextVoterID, _gender, 0, msg.sender);
        nextVoterID++;
    }

    // Candidate Verification function

    function candidateVerification(address _person) internal view returns(bool){
        for(uint i=1; i<nextCandidateID; i++){
           if(CandidateDetails[i].candidateAddress == _person){
               return false;
           }           
        }
        return true;
    }

    // Setting Candidate time for registering 

    function candidateRegistrationSet(uint _registrationStart, uint _registrationStop) public onlyElectionComission() {
        require(votingConductionTime==false, "Voting is ongoing");
        candidate_Registration_Time = true;
        candidate_Registraion_Start = block.timestamp + _registrationStart;
        candidate_Registraion_End = candidate_Registraion_Start + _registrationStop;
    }

    // Registration Phase status

    function candidateRegistrationPhaseStatus() private {
        if(candidate_Registraion_End < block.timestamp) {
            candidate_Registration_Time = false;
        }

    }

    // Voter Pannel

    // Voter Registration

    function voterRegistration(
        string memory _name,
        uint _age,
        string memory _gender
    ) public voterRegistrationPhase() {
        require(_age >= 18, "Youa are under age");
        require(voterVerification(msg.sender) == true, "Already registerd"); 
        VoterDetails[nextVoterID] = Voter(_name, _age, nextVoterID, _gender, 0, msg.sender);
        nextVoterID++;
    }

    function voterVerification(address _person) internal  voterRegistrationPhase() returns(bool){
        for(uint i=1; i<nextVoterID; i++){
            if(VoterDetails[i].voterAddress == _person){
                return false;
            }
        }
        return true;
    }

    function voterRegistrationSet(uint _registrationStart, uint _registrationStop) public onlyElectionComission() {
        require(votingConductionTime==false, "Voting is ongoing");
        voter_Registration_Time = true;
        voter_Registraion_Start = block.timestamp + _registrationStart;
        voter_Registraion_End = voter_Registraion_Start + _registrationStop;
    }

    function voterRegistrationPhaseStatus() private {
        if(voter_Registraion_End < block.timestamp) {
            voter_Registration_Time = false;
        }
    }

    function votingPeriodSet(uint _startTime, uint _endTime) public {
        candidateRegistrationPhaseStatus();
        voterRegistrationPhaseStatus();
        require(nextCandidateID>=3,"Required candidates are insufficient");
        require(candidate_Registration_Time == false, "Candidate registration is going on");
        require(voter_Registration_Time == false, "voter registration is going on");
        votingConductionTime = true;
        voting_Conduction_Start = block.timestamp + _startTime;
        voting_Conduction_End = voting_Conduction_Start + _endTime;
    }


    function votingPhaseStatus() private {
        if(voting_Conduction_End < block.timestamp) {
            votingConductionTime = false;
        }
    }


    function voterList() public view returns(Voter[] memory){
        Voter[] memory votersList = new Voter[](nextVoterID-1);
        for(uint i=1; i<nextVoterID; i++){
            votersList[i-1] = VoterDetails[i];
        }
        return votersList;
    }

    function candidateList() public view returns(Candidate[] memory){
        Candidate[] memory candidatesList = new Candidate[](nextCandidateID-1);
        for(uint i=1; i<nextCandidateID; i++){
            candidatesList[i-1] = CandidateDetails[i];
        }
        return candidatesList;
    }

     function vote(uint _voterID, uint _ID) external {
        require(VoterDetails[_voterID].voteCandidateID ==0, "You have voted");
        require(VoterDetails[_voterID].voterAddress == msg.sender, "You cant vote from others behalf");
        require(nextCandidateID >= 3, "Candidates are not registered completely");
        require(voting_Conduction_Start!=0, "Voting is not started");
        require(_ID < nextCandidateID, "Candidate does not exist");
        VoterDetails[_voterID].voteCandidateID = _ID;
        CandidateDetails[_ID].votes = CandidateDetails[_ID].votes + 1;
    }

    function selectWinner() public onlyElectionComission() returns(address){
        require(block.timestamp>candidate_Registraion_End && candidate_Registraion_End !=0,
         "Candidate registration phase is not closed");
         require(block.timestamp>voting_Conduction_End && voting_Conduction_End !=0,
         "Voting is in conduction phase is not closed");
        uint max =0;
        for(uint i=1; i< nextCandidateID; i++){
            if(CandidateDetails[i].votes > max){
                max = CandidateDetails[i].votes;
                winner = CandidateDetails[i].candidateAddress;
            }
        }
        return winner;
    }
}