// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

contract weeklyChallenge0 {

    address public winner;
    uint canBeNumber;
    string public winnerMessage;
   
    function letMeWin(uint _guess) external {
        canBeNumber = 0;
        require(winner == address(0));
        assembly {

            let _fm := mload(0x40)
            mstore(_fm,0x2C)
            let _num := mload(_fm)
            sstore(canBeNumber.slot,mul(_num,0x2C))

        }
        require(canBeNumber == _guess);
        winner = msg.sender;
    }

    function leaveAchampionMessage(string calldata _message) external {
        require(msg.sender != address(0));
        require(msg.sender == winner);
        winnerMessage = _message;
    }

}
