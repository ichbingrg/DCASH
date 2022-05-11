import Debug "mo:base/Debug";
import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";

actor Token {
    var owner : Principal = Principal.fromText("qqdz6-4f25n-xal4d-fsw3l-7yquc-lsk2m-bdu2j-q7bnw-dcyay-y2awo-zae");
    var totalSupply : Nat = 1000000000;
    var symbol : Text = "DCASH";

    // HashMap<key, value>(intialSize, comparison method, hashing method)
    var balances = HashMap.HashMap<Principal,Nat>(1, Principal.equal, Principal.hash); 
    
    balances.put(owner, totalSupply);

    public query func balanceOf(who : Principal) : async Nat {

        let balance: Nat = switch (balances.get(who)) {
            case null 0;
            case (?result) result;
        };
        return balance;
/*
        if(balances.get(who)== null){
            return 0;
        }else{
            return balances.get(who);
        }*/
    };

    public query func getSymbol() : async Text {
        return symbol;
    };

    public shared(msg) func payOut(): async Text{
        Debug.print(debug_show(msg.caller));
        if (balances.get(msg.caller) == null){ //balances.get(msg.caller) checks if the caller already has received free tokens from us, more tokens are only gifted once
            let amount = 10000;
            balances.put(msg.caller, amount);
            return "success";        
        }else{
            return "Already Claimed";
        }
    };

    public func transfer(){
        // TO be continued..
    };
};