//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 < 0.9.0;



contract Voting_Contract{

    struct voter{
        string name;
        uint age;
        uint voterID;
        string gender;
        uint voteCandidateID;
        address voterAddress;
    }

    struct candidate{
        string name;
        uint age;
        string party;
        uint candidateID;
        string gender;
        address candidateAddress;
        uint votes; 
    }
    address electionComission;
    address public winner;

    mapping(uint=>candidate) candidatesDetails;
    mapping(uint=>voter) voterDetails;

    uint nextCandidateID = 1;
    uint nextVoterID = 1;

    bool stopVoting = false;

    uint startTime;
    uint endTime;

    constructor(){
        electionComission = msg.sender;
    }

    modifier onlyElectionComission() {
        require(msg.sender == electionComission, "You are not from election comission");
        _;
    }

    modifier isVotingOver() {
        require(block.timestamp > endTime || stopVoting == true, "Voting is over");
        _;
    }

    function candidateRegister(
        string calldata _name,
        uint _age,
        string calldata _party,
        string calldata _gender
    ) external {
        require(msg.sender != electionComission, "You are from election comission");
        require(candidateVerification(msg.sender), "You can not register twice");
        require(_age >=18, "You are not eligible");
        candidatesDetails[nextCandidateID] = candidate(
            _name,
            _age,
            _party,
            nextCandidateID,
            _gender,
            msg.sender,
            0
        );
        nextCandidateID++;
    }

    function candidateVerification(address _person) internal view returns(bool) {
        for(uint i=1; i<nextCandidateID; i++){
            if(candidatesDetails[i].candidateAddress == _person){
                return false;
            }
            
        }
        return true;
    }

    function candidateList() public view returns(candidate[] memory){
        candidate[] memory CandidatesList = new candidate[](nextCandidateID - 1);
        for(uint i=1; i<nextCandidateID; i++){
            CandidatesList[i-1] = candidatesDetails[i];
        }
        return CandidatesList;
    }

    function voterRegister(
        string calldata _name,
        uint _age,
        string calldata _gender
    ) public {
        require(_age >=18, "You are under age");
        require(voterVerification(msg.sender), "You have already registered");
        voterDetails[nextVoterID] = voter(_name, 
        _age, 
        nextVoterID, 
        _gender, 
        0, 
        msg.sender);
        nextVoterID++;
    }

    function voterVerification(address _person) internal view returns(bool){
         for(uint i=1; i<nextVoterID; i++){
            if(voterDetails[i].voterAddress == _person){
                return false;
            }
            
        }
        return true;
    }
    
    function voterList() public view returns(voter[] memory){
        voter[] memory VoterList = new voter[](nextVoterID-1);
        for(uint i=1; i<nextVoterID; i++){
            VoterList[i-1] = voterDetails[i];
        }
        return VoterList;
    }

    function vote(uint _voterID, uint _ID) external {
        require(voterDetails[_voterID].voteCandidateID ==0, "You have voted");
        require(voterDetails[_voterID].voterAddress == msg.sender, "You cant vote from others behalf");
        require(nextCandidateID >= 3, "Candidates are not registered completely");
        require(startTime!=0, "Voting is not started");
        require(_ID < nextCandidateID, "Candidate does not exist");
        voterDetails[_voterID].voteCandidateID = _ID;
        candidatesDetails[_ID].votes++;
    }

    // function votingTimeScheduling(uint _startTime, uint _endTime) external onlyElectionComission()  {
    //     startTime = _startTime;
    //     endTime = _endTime;
    // }
    function votingTimeImmediate(uint _startTime, uint _endTime) external onlyElectionComission() {
        startTime = _startTime + block.timestamp;
        endTime = _endTime + _startTime;
    }
    function votingStatus() public view returns(string memory, bool){
        if(startTime ==0){
            return ("Voting is not started", false);
        } else if(endTime > block.timestamp && stopVoting == false){
            return ("Voting is in progress", true);
        } else{
            return ("Voting is over", false);
        }
    }
    function WinnerDeclaration() public onlyElectionComission()  returns(address) {
        uint max =0;
        for(uint i=1; i< nextCandidateID; i++){
            if(candidatesDetails[i].votes > max){
                max = candidatesDetails[i].votes;
                winner = candidatesDetails[i].candidateAddress;
            }
        }
        return winner;
    }
}