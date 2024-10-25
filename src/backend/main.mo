import Principal "mo:base/Principal";
import Text "mo:base/Text";
import Map "mo:map/Map";
import { thash } "mo:map/Map";

import Types "types";

actor {
    stable var name: Text = "";

    var users = Map.new<Text, Types.User>();

    public shared func setName(newName: Text): async () {
        name := newName;
    };

    public query func getName() : async Text {
        return name;
    };

    public shared query (msg) func whoAmI(): async Principal {
        return msg.caller;
    };

    public shared func addUser(data: Types.User): () {
        Map.set(users, thash, Principal.toText(data.id), data);
    };

    public shared func deleteUser(id: Principal): () {
        Map.delete(users, thash, Principal.toText(id));
    };

    // public shared query ({caller}) func getUsers(): async GetUsersResult {
    //     Debug.print("Caller: " # Principal.toText(caller));

    //     if(Principal.isAnonymous(caller)) {
    //         Debug.print("Anonymous user");
    //         return #err("You must be authenticated to get users");
    //     };

    //     Debug.print("Authenticated user");

    //     return #ok(users);
    // };
}
