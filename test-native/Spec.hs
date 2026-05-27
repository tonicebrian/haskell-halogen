module Main (main) where

import qualified Halogen.Svg.AttributesSpec
import Test.Hspec (hspec)
import Prelude

main :: IO ()
main = hspec Halogen.Svg.AttributesSpec.spec
