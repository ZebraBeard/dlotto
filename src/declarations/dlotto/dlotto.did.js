export const idlFactory = ({ IDL }) => {
  return IDL.Service({
    'generateNumber' : IDL.Func([], [IDL.Nat], []),
    'generateNumbersArray' : IDL.Func([IDL.Nat], [IDL.Vec(IDL.Nat)], []),
    'generateWinningNumbers' : IDL.Func([], [IDL.Vec(IDL.Nat)], []),
  });
};
export const init = ({ IDL }) => { return []; };
