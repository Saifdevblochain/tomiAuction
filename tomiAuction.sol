
pragma solidity >=0.8.0;
import "./LinkedList.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract tomuAuction is LinkedList{
    IERC20 public tomi;
    uint public allTomiToken;

    struct Bid{
        uint bidAmount ;
        uint bidPrice ;
    }

    uint public tomiMaxAmount = 100000 ether;

    mapping( address => Bid ) public bids;

    constructor(IERC20 _tomi) {
        tomi = _tomi;
    }
 

    function createBid( uint amount , uint price ) public {
        require(amount + allTomiToken <= tomiMaxAmount  );
        SafeERC20.approve( tomi, msg.sender, address(this), amount);
        bids[msg.sender].bidAmount = amount ;
        bids[msg.sender].bidPrice = price ;
        insertUp(price);
    }

    function getHighest_ () public view{
        getHighest();
    }

}

// placebid
    // take approval
    // check that tokens< 100k
    // save that bids and address 
    // insertup Linkedlist
    // emit event

// cancelBid
    //remove approval
    // pop from linkedlist
    // emit event

// settleAuction
    // 


    