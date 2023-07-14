pragma solidity ^0.5.0;

contract JointSavings {

    address payable accountOne;
    address payable accountTwo;
    address public lastToWithdraw;
    uint public lastWithdrawAmount;
    uint public contractBalance;
    
        //Defined a `require` statement that checks if the `recipient` is equal to either `accountOne` or `accountTwo`. The `requiere` statement returns the text `"You don't own this account!"` if it does not.
        
        function withdraw(uint amount, address payable recipient) public {
        
        //Defined a `require` statement that checks if the `balance` is sufficient to accomplish the withdraw operation. If there are insufficient funds, the text `Insufficient funds!` is returned.
        
        require(recipient==accountOne||recipient==accountTwo, "You don't own this account!");
        require(address(this).balance >= amount, "Insufficient funds!");
        //Added and `if` statement to check if the `lastToWithdraw` is not equal to (`!=`) to `recipient` If `lastToWithdraw` is not equal, then set it to the current value of `recipient`.
        
        if (lastToWithdraw!=recipient) {
            lastToWithdraw=recipient;
        }
        // Called the `transfer` function of the `recipient` and pass it the `amount` to transfer as an argument.
        // Set  `lastWithdrawAmount` equal to `amount`
        recipient.transfer(amount);
        lastWithdrawAmount = amount;
         // Called the `contractBalance` variable and set it equal to the balance of the contract by using `address(this).balance` to refle
        contractBalance = address(this).balance;
        }
        // Defined a `public payable` function named `deposit`.
        function deposit() public payable {
        contractBalance = address(this).balance;
        }

        //Defined a `public` function named `setAccounts` that receive two `address payable` arguments named `account1` and `account2`.
        function setAccounts(address payable account1, address payable account2) public{
        accountOne = account1;
        accountTwo = account2;
        }

        //added the default fallback function** so that your contract can store Ether sent from outside the deposit function.
        function() external payable {}
}
