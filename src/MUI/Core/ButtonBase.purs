module MUI.Core.ButtonBase where

import Prelude

import Effect (Effect)
import Foreign (Foreign)
import Foreign.Object (Object)
import MUI.Core (JSS)
import Prim.Row (class Union)
import React.Basic.DOM (Props_button)
import React.Basic.Events (EventHandler)
import React.Basic.Hooks (JSX, ReactComponent, Ref, element)
import Unsafe.Coerce (unsafeCoerce)

type ButtonBaseActions =
  { focusVisible :: Effect Unit
  }

type TouchRippleProps = Object Foreign

type ButtonBaseProps componentProps =
  ( action :: Ref ButtonBaseActions
  , buttonRef :: Ref Foreign
  , centerRipple :: Boolean
  , classes :: ButtonBaseClassKey
  , component :: ReactComponent { | componentProps } 
  , disabled :: Boolean
  , disableRipple :: Boolean
  , disableTouchRipple :: Boolean
  , focusRipple :: Boolean
  , focusVisibleClassName :: String
  , onFocusVisible :: EventHandler
  , "TouchRippleProps" :: TouchRippleProps
  , type :: ButtonBaseTypeProp 
  | componentProps
  )

foreign import data ButtonBaseTypeProp :: Type
data ButtonBaseType = Submit | Reset | Button

buttonBaseType :: ButtonBaseType -> ButtonBaseTypeProp
buttonBaseType Submit = unsafeCoerce "submit"
buttonBaseType Reset = unsafeCoerce "reset"
buttonBaseType Button = unsafeCoerce "button"

type ButtonBaseClassKeyOptionsJSS = ButtonBaseClassKeyOptionsR JSS
type ButtonBaseClassKeyOptions = ButtonBaseClassKeyOptionsR String
type ButtonBaseClassKeyOptionsR a =
  ( root :: a
  , disabled :: a
  , focusVisible :: a
  )

foreign import data ButtonBasePropsPartial :: Type

foreign import data ButtonBaseClassKey :: Type
foreign import data ButtonBaseClassKeyJSS :: Type

buttonBaseClassKey :: ∀ options options_
  . Union options options_ ButtonBaseClassKeyOptions
  => Record options
  -> ButtonBaseClassKey
buttonBaseClassKey = unsafeCoerce

buttonBaseClassKeyJSS :: ∀ options options_
  . Union options options_ ButtonBaseClassKeyOptionsJSS
  => Record options
  -> ButtonBaseClassKeyJSS
buttonBaseClassKeyJSS = unsafeCoerce

buttonBasePartial_component :: ∀ componentProps props props_
  . Union props props_ (ButtonBaseProps componentProps)
  => Record props 
  -> ButtonBasePropsPartial
buttonBasePartial_component = unsafeCoerce

buttonBasePartial :: ∀ props props_
  . Union props props_ (ButtonBaseProps Props_button)
  => Record props 
  -> ButtonBasePropsPartial
buttonBasePartial = unsafeCoerce


buttonBase_component :: ∀ componentProps props props_
  . Union props props_ (ButtonBaseProps componentProps)
  => Record props 
  -> JSX
buttonBase_component = element _ButtonBase

buttonBase :: ∀ props props_
  . Union props props_ (ButtonBaseProps Props_button)
  => Record props 
  -> JSX
buttonBase = element _ButtonBase


foreign import _ButtonBase :: ∀ a. ReactComponent a