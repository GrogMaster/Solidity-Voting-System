// Version of solidity
pragma solidity ^0.8.0;

// Start of the contract
contract VotingSystem {
    // This line creates a public mapping called "votesReceived" that maps candidate names (strings) to the number of votes they have received (uintegers)
    mapping (string => uint) public votesReceived;
    
    // This line creates a public string array called "candidateList" that stores the names of all the candidates
    string[] public candidateList;

    // This is the constructor function that gets executed when the contract is deployed
    constructor(string[] memory candidateNames) {
        // It takes an array of candidate names and initializes the "candidateList" array
        candidateList = candidateNames;
    }
    
    // This function allows a voter to cast their vote for a particular candidate
    function voteForCandidate(string memory candidate) public {
    // It first checks if the candidate is valid using the "validCandidate" function ...
        require(validCandidate(candidate));
        
        // .. and then increments the vote count for that candidate in the "votesReceived" mapping
        votesReceived[candidate] += 1;
    }

    // This function returns the total number of votes received by a particular candidate
    function totalVotesForCandidate(string memory candidate) public view returns (uint) {
        // It first checks if the candidate is valid using the "validCandidate" function ...
        require(validCandidate(candidate));

        // ... and then returns the vote count for that candidate from the "votesReceived" mapping
        return votesReceived[candidate];
    }

    // This function checks if a given candidate name is valid or not
    function validCandidate(string memory candidate) public view returns (bool) {
        // It loops through the "candidateList" array and checks if the hash of the current candidate name matches the hash of the given candidate name
        for (uint i = 0; i < candidateList.length; i++) {
            
            // If a match is found, it returns true, otherwise it returns false
            if (keccak256(bytes(candidateList[i])) == keccak256(bytes(candidate))) {
                return true;
            }
        }
        return false;
    }
}

// Made By GrogMaster
