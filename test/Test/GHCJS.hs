{-# LANGUAGE CPP #-}

-- | GHC-JS-only test specs. The assertions exercise the JavaScript FFI
-- (e.g. "Data.Foreign"), so they can only run when the suite is built
-- with the JavaScript backend. Under a native GHC they collapse to a
-- single 'xdescribe' placeholder, matching the @#if defined(javascript_HOST_ARCH)@
-- convention used throughout the library.
module Test.GHCJS (ghcjsSpec) where

import Test.Hspec (Spec, xdescribe)
import Prelude

#if defined(javascript_HOST_ARCH)
import Data.Foreign (Foreign, foreignToBool)
import Test.Hspec (describe, it, shouldBe)

foreign import javascript unsafe "(() => { return true; })" js_true :: Foreign Bool

foreign import javascript unsafe "(() => { return false; })" js_false :: Foreign Bool
#endif

ghcjsSpec :: Spec
#if defined(javascript_HOST_ARCH)
ghcjsSpec = describe "Data.Foreign (GHC-JS)" $ do
  it "foreignToBool maps a truthy JS value to True" $
    foreignToBool js_true `shouldBe` True
  it "foreignToBool maps a falsy JS value to False" $
    foreignToBool js_false `shouldBe` False
#else
ghcjsSpec = xdescribe "GHC-JS tests disabled for native GHC" $ pure ()
#endif
