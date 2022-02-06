import Array "mo:base/Array";
import Buffer "mo:base/Buffer";
import Iter "mo:base/Iter";
import List "mo:base/List";
import Nat "mo:base/Nat";
import Nat8 "mo:base/Nat8";
import Random "mo:base/Random";
import Text "mo:base/Text";

actor {
    let minNumber: Nat = 1;
    let maxNumber: Nat = 24;
    let superBallMaxNumber = 10;

    let buff = Buffer.Buffer<Nat>(1);

    // return one random number in range [1..24]
    public func generateNumber () : async Nat {
        var number : Nat = switch (await generateOneNumber()) {
            case null 25;
            case (?int) int;
        };

        if (Nat.greater(number, maxNumber) or Nat.less(number, minNumber)) {
            number := await generateNumber();
        };

        return number;
    };

    // generate one random number [0..2^6-1]
    func generateOneNumber () : async ?Nat {
        let entropy = await Random.blob(); // get initial entropy
        let p : Nat8 = 6;
        let number = Random.Finite(entropy).range(p);

        return number;
    };

    // generates 4 regular numbers and 1 bonus numers
    public func generateWinningNumbers () : async [Nat] {
        var balls = buff.clone();
        let regularBalls : [Nat] = await generateNumbersArray(4);
        let bonusBall : [Nat] = await generateNumbersArray(1);

        for (i in regularBalls.vals()) {
            balls.add(i);
        };

        for (j in bonusBall.vals()) {
            balls.add(j);
        };

        return balls.toArray();
    };
    
    // generates immutable array of 5 numbers
    public func generateNumbersArray (limit : Nat) : async [Nat] {
        let randomNumbers : [var Nat] = Array.init(limit,0);

        for (i in Iter.range(0, limit - 1)) {
            randomNumbers[i] := (await generateNumber());
        };

        return Array.freeze(randomNumbers);
    };
};
