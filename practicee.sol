// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

// variable: is used to store data or vale that are used in smart contract.
// state variable:
                // variable that declae on contrac level the default value state variable is zero.
                //They are stored on blockchain memory. it  it is enatalize at where its name is
                // used like "uint private age=10"
                contract localvar{
                    uint private age=10;
                }
                // to initalize it we can create constructor

                contract loacalvar{
                    uint public  age1;
                    constructor()  
                 {  
                    age1 =10;
                    }

                }
                // we can use local variable by making getter function
                contract localvari{
                    uint public agee;
                    function setagee() public
                   {
                    agee=10;
                   }

                }


                //Local variable:
                //              those variable thar=t declare ibside function. They are store on stack not blockchain.
                //              It does not need gas fee.
                //              it initalize inside the function.

                contract localvariable{
                    function store() pure public returns(uint)
                  {
                    uint age=19;
                    return age;
                  }
                }



                //Function:
                          // reuseable block of code that perform spercific task.
                          // how function work?
                          //how to create function?
                          //what things is need to make function?


                          // Getter function:

                          contract fun{
                            uint age2;
                            function getter() public view returns(uint)
                            {
                            return  age2;
                            }                        
                             }


                             // Setter function
                             contract funn{
                                uint age3=10;
                                function setter() public 
                              {
                                age3=age3+3;
                              }
                             }

                             
                             contract func{
                               uint age4;
                               function getter() public  returns (uint)
                               {
                                age4=15;
                                return age4;
                               }

                               function setter(uint newage) public  returns (uint)
                               {
                                return age4=newage;
                               }
                             }





    //Pure vs View:
    //pure: used where not read allowed neigther modified allowed
    //view: is used wher only read is allowed but modified is not allowed


    //view:

    contract vie{
        uint rollno=111;
        function vieww() public view returns(uint)
        {
             return rollno;
        }
    }

    //pure:
    contract pur{
        function   purr() public pure returns(uint)
        {
           uint  class=1111;
            return class;
        }
    }



    // Visibality in solidty:
    //                      There are 4 type of visibality in silidity
    //                      Public: function or variable that can access inside and outside of contract
    //                      Private: Function or variable that can access inside the same contract 
    //                      Internal:The function or variable can be accessed within the same contract and 
    //                                 derived contracts (subclasses). 
    //                      External:The function can be called only from outside the contract (not internally).



   //  Constructor in solidity:
   //                         spectial type of function which execute only one time when contract is created.
   //                         It is also used for the initalization of state variable.
   //                         It is also used when we decide the owner of our contract. 
   //


                              contract demo{
                                uint count;
                                constructor() 
                                {
                                    count = 10;
                                }
                              }
   


   /*Data type: 
               Value types: uint,     int, bool, address, bytes
                 Reference types:     string, array, mapping, struct
               Special types:         enum, function
   
   
   */




   /* Arrays in solidity:
                        There are two type of array in solidity.
                           1   Fixed size array
                           2   Dyanmic array    */


  //               Fixed size array:
  //                               The type of array in which we know the size of array at compile time.



  contract array{
    uint[4] public arrr=[10,20,30,40];
    function setter(uint _index,uint _value) public 
    {
        arrr[_index]=_value;
    }
    function len() public view returns(uint)
   {
     return arrr.length;
   }
  }




// Peactice these concept

/*
A state variable to store a number (count).
A setter function to increment the count by 1.
A getter function to return the current value of count.
A constructor to initialize the count to 0 when the contract is deployed.

*/

contract challange{
    uint public count;
     constructor() 
    {
        count=0;
    }
    function setter(uint) public 
    {
        count +=1;
        }
     
    function getter() public  view returns(uint)
   {
     return  count;
   }
   
}



/*
Task: Create a Voting Contract
Create a contract named Voting.
Add a state variable to store the total number of votes (votes).
Use a constructor to initialize votes to 0.
Write a setter function named vote that increments the vote count by 1 each time it is called.
Write a getter function named getVotes to return the current number of votes.
Add another state variable to store the owner of the contract using msg.sender.
Write a function to check if the current caller is the owner (return true if the caller is the owner, otherwise false).
*/



contract voting{
    uint public votes;
    address public owner;

    constructor()
    {
        votes =0;
        owner =msg.sender;
    }
    function vote() public returns(uint)
     {
        votes=votes+1;
     return votes;
     }
     function getvotes() public view returns(uint)
     {
        return votes;
     }
     function currentowner() public view returns (bool)
     {
        return msg.sender== owner;
     }
}




/*
Task: Create a Simple Bank Contract
State Variables:

Add a state variable to store the balance of the contract.
Add a state variable to store the owner's address using msg.sender (just like before).
Functions:

Write a function deposit() that allows users to deposit ether into the contract (increase the balance).
Write a function withdraw(uint amount) that allows the owner to withdraw a specific amount of ether (decrease the balance).
Write a getter function getBalance() to return the current balance of the contract.
Hint:

Use payable to make functions able to accept ether.
*/

contract bank{
    uint balance;
    address owneraddress;
    constructor() 
    {
        balance = 0;
        owneraddress = msg.sender;
    }

    function deposit() public payable
    {
     balance +=msg.value;
    }
    function getbalance() public view returns(uint)
    {
        return balance;
    }
}
 



/*
Task: Create a Simple Fundraising Contract
Objective:

Create a contract that allows users to contribute ether to a fundraising goal.
The contract should track the total amount raised.
The contract should allow users to see the current amount raised.
Once the goal is met, the contract should allow the owner to withdraw the total raised amount.
Requirements:

A state variable to store the fundraising goal.
A state variable to store the total amount raised.
A function to allow users to contribute ether (deposit).
A getter function to show the total amount raised.
A function for the owner to withdraw the raised amount when the goal is met.
*/



contract Fundraising {
    uint public goal;
    uint public totalAmount;

    constructor(uint _goal) {
        goal = _goal;  
        totalAmount = 0;  
    }

    
    receive() external payable {
        require(msg.value > 0, "Contribution must be greater than 0");
        totalAmount += msg.value;  
    }

   
    function getter() public view returns (uint) {
        return totalAmount;
    }
}




/*
 Create a contract that allows the owner to set a price for an item.

Add a state variable for the price.
Write a setter function that allows the owner to update the price.
Write a getter function to return the current price.
*/

contract price_of_item{
    int public price;
    constructor()
    {
        price=0;
    }
    function setter(int _newprice) public 
    {
    price = _newprice; 
    }
    function getter() public view returns(int)
    {
        return price;
    }
} 






/*
Task: Create a simple contract for a digital wallet
Create a contract named DigitalWallet.
Add a state variable to store the balance of the wallet.
Add a function deposit() that allows a user to deposit ether into the contract (use msg.value).
Add a function withdraw() that allows the owner to withdraw ether (but only the owner can withdraw).
Add a function getBalance() that returns the current balance of the wallet.
*/

pragma solidity ^0.8.0;

contract DigitalWallet {
    address public owner;
    uint public balance;

    constructor() {
        owner = msg.sender;  
        balance = 0;
    }

   
    function deposit() public payable {
        balance += msg.value;
    }

   
    function getBalance() public view returns (uint) {
        return balance;
    }

    
    function withdraw(uint amount) public {
        require(msg.sender == owner, "Only the owner can withdraw");  
        require(amount <= balance, "Insufficient balance"); 
        balance -= amount;  
        payable(owner).transfer(amount);  
    }
}

/*
Task: Create a smart contract that allows a user to store their age and favorite number. The contract should have the following features:

A constructor to initialize the user's age and favorite number.
Getter functions to retrieve both the age and the favorite number.
Setter functions to update the age and favorite number.
Use visibility modifiers (public, private) appropriately.
Use a view function to return the user's age and a pure function to return the favorite number.
*/

contract practice{
    uint public age;
    uint public favno;
    constructor ()
    {
    age =0;
    favno =0;
    }
    function getter() public view  returns(uint)
    {
        
        return favno;
    }
    function setage(uint _newage) public 
    {
        age = _newage;
    }
    
    
}




// other remaning topics:
/*
Dynamic array:
            The type of array in which we dont need to tell the size of array at compilen time.
            There are several method in dynamic size array in order to push, pop and determine the length of array.

*/

// Push item in dynamic array:
contract arr{
    uint[] public arrrr;
    function pushelement(uint item) public {
        arrrr.push (item);
    }
    function len() public view returns(uint)
    {
        return arrrr.length;
    }
    function popelement() public 
    {
        arrrr.pop();
    }
}



/*
1 byte == 8bit
1 hexadecimal digit == 4 bit 
Every thigs that will be store in byte array will be in the form of hexadecimal digit.
Byte array:  (fixed size size)
           Byte array cant be modified 

          
*/
contract byte_array{
    bytes3 public b1;
    bytes2 public b2;
    function setter() public 
             {
                b1="abd";
                b2="ab";
    
             }
}




/*
Byte array: (Dynamic size)
*/

// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract bytearray {
    bytes public b3 = "abc";
    bytes public b4 = "abcd";

    
    function pushelement() public {
        b3.push("d");
    }

    function getelement(uint i) public view returns (bytes1) {
        require(i < b3.length, "Index out of bounds");
        return b3[i];
    }
}


/*
Loops in solidty: Loops are used to repeat block of code.
                  In solidity there are 3 types of loops.
                   While
                   For 
                   Dowhile
        loops alwasy work in a functon.

*/

contract loop{
    uint[5] public ar;
    uint public count;
    function looop() public{
         while (count<ar.lenth)
         {
            ar[count]=count;
            count++;
         }
}

    
}


/*
conditions:  Condition are used to execute different code based on different condition.
              if
              else if
              else 
            
*/

contract condition
{
    
    function check(int a) public pure returns(string memory)
    {
        string memory value;
        if (a > 0)
        {
            value= "greater than zero";
        }
        else if (a == 0)
        {
            value="equal to zero";
        }
        else
        {
            value="less than zero";
        }
        return value;
    }   
}


/*
Bool data type:
              Basically bool data type hold 2 values that is 
              true and false
              By default its value is false.
              operation that we can apply on bool data type.
              == (equal to)
              != (inequality)
              ! (logical negation)
              && (logical conjuction "and")
              || (logical disjunction   "or")
*/


contract bol{
    bool public value=true;
    bool public count=false;
    bool public ali;
}


contract boool{
    bool public valu=true;
    function chek(uint a) public returns(bool)
    {
        if (a>10)
        {
            valu= true;
            return valu;
        }
        else 
        {
            valu=false;
            return valu;
        }
    }
}


/*
Structure: Strucure in silidity is custom data type that group multiple variable into one entity 
lske student record(name,roll no) it is used to organized related data.
*/


struct student{
    string   name;
    uint  roll;
    string  class;
    uint  id; 
}
contract demo{
             student public s1;
             constructor(string  memory _name, uint _roll,string memory _class, uint _id)
             {
                s1.name = _name;
                s1.roll = _roll;
                s1.class = _class;
                s1.id = _id;
             }
}




struct teacher{
    string name;
    uint teacheraddress;
    string scale;
    uint id;
}
contract demoo{
    teacher public s2;
    constructor(string memory _name, uint _teacheraddress, string memory _scale, uint _id)
    {
        s2.name = _name;
        s2.teacheraddress=_teacheraddress;
        s2.scale=_scale;
        s2.id=_id;
    }
}    






/*
Enum keywork:
            when we assign the name to a particular integer or constant or integral value that is callled enum.
            we can make it outside and also inside of the contract
            use where variable set is limited
*/

contract state {
    enum user{allowed, not_allowed, wait }
    user public u1;
    uint public lottery=1000;
    function owner() public 
    {
        if (u1==user.allowed)
        {
            lottery=0;
        }
    }
}



/*
Mapping: The process of maping key to a particular value.
*/

contract dmo{
    mapping (uint=>string) roll_no;
    function setter(uint keys ,string memory value) public 
    {
        roll_no[key]=value;
    }
}



  /*
Create a contract with a state variable to store a user's name 
and age. Write getter and setter functions to manage these values.
*/

contract user{
    uint public age;
    string  public name;
    constructor()
    {
        age=10;
        name= "ali";
        } 
        function getter() public view returns(uint,string memory)
        {
            return (age,name);
          
        }
        function setter() public view returns(uint ,string memory )
        {
         return (age,name);
        }
    
}



