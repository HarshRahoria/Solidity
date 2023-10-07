// SPDX-License-Identifier: MIT
pragma solidity >0.7.0 < 0.9.0;

contract TweeterContract{
    struct Tweet{
        uint id;
        address author;
        string content;
        uint createdAt;
    } 
    struct Message{
        uint id;
        address from;
        address to;
        string content;
        uint createdAt;
    }

    mapping(uint=>Tweet) private tweets;
    mapping(address=>uint[]) private tweetsOf;
    mapping(address => Message[]) private conversations;
    mapping(address => mapping (address => bool)) private operators;
    mapping(address => address[]) private following;

    uint nextId;
    uint nextMessageId;

    function _tweet(address _author, string calldata _content) internal {
        require(_author == msg.sender || operators[_author][msg.sender] == true, "Access denied");
        tweets[nextId] = Tweet(nextId, _author, _content, block.timestamp);
        tweetsOf[_author].push(nextId);
        nextId++;
    }

    function _sendMessage(address _from, address _to, string calldata _content) internal{
        require(_from == msg.sender || operators[_from][msg.sender] == true, "Access denied");
        conversations[_from].push(Message(nextMessageId, _from, _to, _content, block.timestamp));
        nextMessageId++;
    }

    function tweet(string calldata _content) public {
        _tweet(msg.sender, _content);
    }

    function tweet(address _author, string calldata _content) public {
        _tweet(_author, _content);
    }

    function sendMessage(address _to, string calldata _content) public{
        _sendMessage(msg.sender, _to, _content);
    }

    function sendMessage(address _from, address _to, string calldata _content) public {
        _sendMessage(_from, _to, _content);
    }

    function follow(address _followed) public{
        following[msg.sender].push(_followed);
    }

    function allowAccess(address _operator) public{
        operators[msg.sender] [_operator] = true;
    }
    
    function denyAccess(address _operator) public{
        operators[msg.sender] [_operator] = false;
    }

    function getLastestTweets(uint count) public view returns(Tweet[] memory){
        require(count > 0 && count < nextId, "Count is not proper");
        Tweet[] memory latestTweets = new Tweet[](count);
        uint j;
        for(uint i=nextId - count; i<nextId; i++){
            Tweet storage _structure = tweets[i];
            latestTweets[j] = Tweet(
                _structure.id,
                _structure.author,
                _structure.content,
                _structure.createdAt
            );
            j++;
        }
        return latestTweets;
    }

    function getLatestTweetsOfUser(address _user, uint count) public view returns(Tweet[] memory){
        require(count >0 && count < tweetsOf[_user].length, "Count is not proper");
        Tweet[] memory userTweets = new Tweet[](count);
        uint[] memory tweetIds = tweetsOf[_user];
        uint j;
        for(uint i=tweetsOf[_user].length - count; i < tweetsOf[_user].length; i++){
            Tweet storage _structure = tweets[tweetIds[i]];
            userTweets[j] = Tweet(
                _structure.id,
                _structure.author,
                _structure.content,
                _structure.createdAt
            );
            j++;
        }
        return userTweets;
    }
} 