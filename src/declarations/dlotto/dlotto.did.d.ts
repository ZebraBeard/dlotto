import type { Principal } from '@dfinity/principal';
export interface _SERVICE {
  'generateNumber' : () => Promise<bigint>,
  'generateNumbersArray' : (arg_0: bigint) => Promise<Array<bigint>>,
  'generateWinningNumbers' : () => Promise<Array<bigint>>,
}
