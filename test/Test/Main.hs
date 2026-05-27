module Main (main) where

import Test.GHCJS (ghcjsSpec)
import Test.Hspec (hspec)
import Test.Native (nativeSpec)
import Prelude

main :: IO ()
main = hspec $ do
  nativeSpec
  ghcjsSpec
