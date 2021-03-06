module DOM.Event.Types
  ( Event()
  , EventType(..)
  , EventTarget()
  , readEventTarget
  , AnimationEvent()
  , animationEventToEvent
  , readAnimationEvent
  , AudioProcessingEvent()
  , audioProcessingEventToEvent
  , readAudioProcessingEvent
  , BeforeInputEvent()
  , beforeInputEventToEvent
  , readBeforeInputEvent
  , BeforeUnloadEvent()
  , beforeUnloadEventToEvent
  , readBeforeUnloadEvent
  , BlobEvent()
  , blobEventToEvent
  , readBlobEvent
  , ClipboardEvent()
  , clipboardEventToEvent
  , readClipboardEvent
  , CloseEvent()
  , closeEventToEvent
  , readCloseEvent
  , CompositionEvent()
  , compositionEventToEvent
  , readCompositionEvent
  , CSSFontFaceLoadEvent()
  , cssFontFaceLoadEventToEvent
  , readCSSFontFaceLoadEvent
  , CustomEvent()
  , customEventToEvent
  , readCustomEvent
  , DeviceLightEvent()
  , deviceLightEventToEvent
  , readDeviceLightEvent
  , DeviceMotionEvent()
  , deviceMotionEventToEvent
  , readDeviceMotionEvent
  , DeviceOrientationEvent()
  , deviceOrientationEventToEvent
  , readDeviceOrientationEvent
  , DeviceProximityEvent()
  , deviceProximityEventToEvent
  , readDeviceProximityEvent
  , DOMTransactionEvent()
  , domTransactionEventToEvent
  , readDOMTransactionEvent
  , DragEvent()
  , dragEventToEvent
  , readDragEvent
  , EditingBeforeInputEvent()
  , editingBeforeInputEventToEvent
  , readEditingBeforeInputEvent
  , ErrorEvent()
  , errorEventToEvent
  , readErrorEvent
  , FetchEvent()
  , fetchEventToEvent
  , readFetchEvent
  , FocusEvent()
  , focusEventToEvent
  , readFocusEvent
  , GamepadEvent()
  , gamepadEventToEvent
  , readGamepadEvent
  , HashChangeEvent()
  , hashChangeEventToEvent
  , readHashChangeEvent
  , IDBVersionChangeEvent()
  , idbVersionChangeEventToEvent
  , readIDBVersionChangeEvent
  , InputEvent()
  , inputEventToEvent
  , readInputEvent
  , KeyboardEvent()
  , keyboardEventToEvent
  , readKeyboardEvent
  , MediaStreamEvent()
  , mediaStreamEventToEvent
  , readMediaStreamEvent
  , MessageEvent()
  , messageEventToEvent
  , readMessageEvent
  , MouseEvent()
  , mouseEventToEvent
  , readMouseEvent
  , MutationEvent()
  , mutationEventToEvent
  , readMutationEvent
  , OfflineAudioCompletionEvent()
  , offlineAudioCompletionEventToEvent
  , readOfflineAudioCompletionEvent
  , PageTransitionEvent()
  , pageTransitionEventToEvent
  , readPageTransitionEvent
  , PointerEvent()
  , pointerEventToEvent
  , readPointerEvent
  , PopStateEvent()
  , popStateEventToEvent
  , readPopStateEvent
  , ProgressEvent()
  , progressEventToEvent
  , readProgressEvent
  , RelatedEvent()
  , relatedEventToEvent
  , readRelatedEvent
  , RTCDataChannelEvent()
  , rtcDataChannelEventToEvent
  , readRTCDataChannelEvent
  , RTCIdentityErrorEvent()
  , rtcIdentityErrorEventToEvent
  , readRTCIdentityErrorEvent
  , RTCIdentityEvent()
  , rtcIdentityEventToEvent
  , readRTCIdentityEvent
  , RTCPeerConnectionIceEvent()
  , rtcPeerConnectionIceEventToEvent
  , readRTCPeerConnectionIceEvent
  , SensorEvent()
  , sensorEventToEvent
  , readSensorEvent
  , StorageEvent()
  , storageEventToEvent
  , readStorageEvent
  , SVGEvent()
  , svgEventToEvent
  , readSVGEvent
  , SVGZoomEvent()
  , svgZoomEventToEvent
  , readSVGZoomEvent
  , TimeEvent()
  , timeEventToEvent
  , readTimeEvent
  , TouchEvent()
  , touchEventToEvent
  , readTouchEvent
  , TransitionEvent()
  , transitionEventToEvent
  , readTransitionEvent
  , UIEvent()
  , uiEventToEvent
  , readUIEvent
  , UserProximityEvent()
  , userProximityEventToEvent
  , readUserProximityEvent
  , WheelEvent()
  , wheelEventToEvent
  , readWheelEvent
  ) where

import Prelude

import Control.Monad.Eff (Eff())

import Data.Either (Either(..))
import Data.Foreign (Foreign(), F(), unsafeReadTagged)
import Data.Foreign.Class (IsForeign)
import qualified Data.Maybe.Unsafe as U

import qualified Unsafe.Coerce as U

import DOM
import DOM.Event.EventPhase
import DOM.Node.Types

-- | Basic type for all DOM events.
foreign import data Event :: *

-- | The type of strings used for event types.
newtype EventType = EventType String

instance eqEventType :: Eq EventType where
  eq (EventType x) (EventType y) = x == y

instance ordEventType :: Ord EventType where
  compare (EventType x) (EventType y) = compare x y

-- | A DOM item that can emit events.
foreign import data EventTarget :: *

readEventTarget :: Foreign -> F EventTarget
readEventTarget = _readEventTarget Left Right

foreign import _readEventTarget :: (forall a b. a -> Either a b) -> (forall a b. b -> Either a b) -> Foreign -> F EventTarget

instance isIsForeignEventTarget :: IsForeign EventTarget where
  read = readEventTarget

unsafeToEvent :: forall e. e -> Event
unsafeToEvent = U.unsafeCoerce

foreign import data AnimationEvent :: *

animationEventToEvent :: AnimationEvent -> Event
animationEventToEvent = unsafeToEvent

readAnimationEvent :: Foreign -> F AnimationEvent
readAnimationEvent = unsafeReadTagged "AnimationEvent"

instance isIsForeignAnimationEvent :: IsForeign AnimationEvent where
  read = readAnimationEvent

foreign import data AudioProcessingEvent :: *

audioProcessingEventToEvent :: AudioProcessingEvent -> Event
audioProcessingEventToEvent = unsafeToEvent

readAudioProcessingEvent :: Foreign -> F AudioProcessingEvent
readAudioProcessingEvent = unsafeReadTagged "AudioProcessingEvent"

instance isIsForeignAudioProcessingEvent :: IsForeign AudioProcessingEvent where
  read = readAudioProcessingEvent

foreign import data BeforeInputEvent :: *

beforeInputEventToEvent :: BeforeInputEvent -> Event
beforeInputEventToEvent = unsafeToEvent

readBeforeInputEvent :: Foreign -> F BeforeInputEvent
readBeforeInputEvent = unsafeReadTagged "BeforeInputEvent"

instance isIsForeignBeforeInputEvent :: IsForeign BeforeInputEvent where
  read = readBeforeInputEvent

foreign import data BeforeUnloadEvent :: *

beforeUnloadEventToEvent :: BeforeUnloadEvent -> Event
beforeUnloadEventToEvent = unsafeToEvent

readBeforeUnloadEvent :: Foreign -> F BeforeUnloadEvent
readBeforeUnloadEvent = unsafeReadTagged "BeforeUnloadEvent"

instance isIsForeignBeforeUnloadEvent :: IsForeign BeforeUnloadEvent where
  read = readBeforeUnloadEvent

foreign import data BlobEvent :: *

blobEventToEvent :: BlobEvent -> Event
blobEventToEvent = unsafeToEvent

readBlobEvent :: Foreign -> F BlobEvent
readBlobEvent = unsafeReadTagged "BlobEvent"

instance isIsForeignBlobEvent :: IsForeign BlobEvent where
  read = readBlobEvent

foreign import data ClipboardEvent :: *

clipboardEventToEvent :: ClipboardEvent -> Event
clipboardEventToEvent = unsafeToEvent

readClipboardEvent :: Foreign -> F ClipboardEvent
readClipboardEvent = unsafeReadTagged "ClipboardEvent"

instance isIsForeignClipboardEvent :: IsForeign ClipboardEvent where
  read = readClipboardEvent

foreign import data CloseEvent :: *

closeEventToEvent :: CloseEvent -> Event
closeEventToEvent = unsafeToEvent

readCloseEvent :: Foreign -> F CloseEvent
readCloseEvent = unsafeReadTagged "CloseEvent"

instance isIsForeignCloseEvent :: IsForeign CloseEvent where
  read = readCloseEvent

foreign import data CompositionEvent :: *

compositionEventToEvent :: CompositionEvent -> Event
compositionEventToEvent = unsafeToEvent

readCompositionEvent :: Foreign -> F CompositionEvent
readCompositionEvent = unsafeReadTagged "CompositionEvent"

instance isIsForeignCompositionEvent :: IsForeign CompositionEvent where
  read = readCompositionEvent

foreign import data CSSFontFaceLoadEvent :: *

cssFontFaceLoadEventToEvent :: CSSFontFaceLoadEvent -> Event
cssFontFaceLoadEventToEvent = unsafeToEvent

readCSSFontFaceLoadEvent :: Foreign -> F CSSFontFaceLoadEvent
readCSSFontFaceLoadEvent = unsafeReadTagged "CSSFontFaceLoadEvent"

instance isIsForeignCSSFontFaceLoadEvent :: IsForeign CSSFontFaceLoadEvent where
  read = readCSSFontFaceLoadEvent

foreign import data CustomEvent :: *

customEventToEvent :: CustomEvent -> Event
customEventToEvent = unsafeToEvent

readCustomEvent :: Foreign -> F CustomEvent
readCustomEvent = unsafeReadTagged "CustomEvent"

instance isIsForeignCustomEvent :: IsForeign CustomEvent where
  read = readCustomEvent

foreign import data DeviceLightEvent :: *

deviceLightEventToEvent :: DeviceLightEvent -> Event
deviceLightEventToEvent = unsafeToEvent

readDeviceLightEvent :: Foreign -> F DeviceLightEvent
readDeviceLightEvent = unsafeReadTagged "DeviceLightEvent"

instance isIsForeignDeviceLightEvent :: IsForeign DeviceLightEvent where
  read = readDeviceLightEvent

foreign import data DeviceMotionEvent :: *

deviceMotionEventToEvent :: DeviceMotionEvent -> Event
deviceMotionEventToEvent = unsafeToEvent

readDeviceMotionEvent :: Foreign -> F DeviceMotionEvent
readDeviceMotionEvent = unsafeReadTagged "DeviceMotionEvent"

instance isIsForeignDeviceMotionEvent :: IsForeign DeviceMotionEvent where
  read = readDeviceMotionEvent

foreign import data DeviceOrientationEvent :: *

deviceOrientationEventToEvent :: DeviceOrientationEvent -> Event
deviceOrientationEventToEvent = unsafeToEvent

readDeviceOrientationEvent :: Foreign -> F DeviceOrientationEvent
readDeviceOrientationEvent = unsafeReadTagged "DeviceOrientationEvent"

instance isIsForeignDeviceOrientationEvent :: IsForeign DeviceOrientationEvent where
  read = readDeviceOrientationEvent

foreign import data DeviceProximityEvent :: *

deviceProximityEventToEvent :: DeviceProximityEvent -> Event
deviceProximityEventToEvent = unsafeToEvent

readDeviceProximityEvent :: Foreign -> F DeviceProximityEvent
readDeviceProximityEvent = unsafeReadTagged "DeviceProximityEvent"

instance isIsForeignDeviceProximityEvent :: IsForeign DeviceProximityEvent where
  read = readDeviceProximityEvent

foreign import data DOMTransactionEvent :: *

domTransactionEventToEvent :: DOMTransactionEvent -> Event
domTransactionEventToEvent = unsafeToEvent

readDOMTransactionEvent :: Foreign -> F DOMTransactionEvent
readDOMTransactionEvent = unsafeReadTagged "DOMTransactionEvent"

instance isIsForeignDOMTransactionEvent :: IsForeign DOMTransactionEvent where
  read = readDOMTransactionEvent

foreign import data DragEvent :: *

dragEventToEvent :: DragEvent -> Event
dragEventToEvent = unsafeToEvent

readDragEvent :: Foreign -> F DragEvent
readDragEvent = unsafeReadTagged "DragEvent"

instance isIsForeignDragEvent :: IsForeign DragEvent where
  read = readDragEvent

foreign import data EditingBeforeInputEvent :: *

editingBeforeInputEventToEvent :: EditingBeforeInputEvent -> Event
editingBeforeInputEventToEvent = unsafeToEvent

readEditingBeforeInputEvent :: Foreign -> F EditingBeforeInputEvent
readEditingBeforeInputEvent = unsafeReadTagged "EditingBeforeInputEvent"

instance isIsForeignEditingBeforeInputEvent :: IsForeign EditingBeforeInputEvent where
  read = readEditingBeforeInputEvent

foreign import data ErrorEvent :: *

errorEventToEvent :: ErrorEvent -> Event
errorEventToEvent = unsafeToEvent

readErrorEvent :: Foreign -> F ErrorEvent
readErrorEvent = unsafeReadTagged "ErrorEvent"

instance isIsForeignErrorEvent :: IsForeign ErrorEvent where
  read = readErrorEvent

foreign import data FetchEvent :: *

fetchEventToEvent :: FetchEvent -> Event
fetchEventToEvent = unsafeToEvent

readFetchEvent :: Foreign -> F FetchEvent
readFetchEvent = unsafeReadTagged "FetchEvent"

instance isIsForeignFetchEvent :: IsForeign FetchEvent where
  read = readFetchEvent

foreign import data FocusEvent :: *

focusEventToEvent :: FocusEvent -> Event
focusEventToEvent = unsafeToEvent

readFocusEvent :: Foreign -> F FocusEvent
readFocusEvent = unsafeReadTagged "FocusEvent"

instance isIsForeignFocusEvent :: IsForeign FocusEvent where
  read = readFocusEvent

foreign import data GamepadEvent :: *

gamepadEventToEvent :: GamepadEvent -> Event
gamepadEventToEvent = unsafeToEvent

readGamepadEvent :: Foreign -> F GamepadEvent
readGamepadEvent = unsafeReadTagged "GamepadEvent"

instance isIsForeignGamepadEvent :: IsForeign GamepadEvent where
  read = readGamepadEvent

foreign import data HashChangeEvent :: *

hashChangeEventToEvent :: HashChangeEvent -> Event
hashChangeEventToEvent = unsafeToEvent

readHashChangeEvent :: Foreign -> F HashChangeEvent
readHashChangeEvent = unsafeReadTagged "HashChangeEvent"

instance isIsForeignHashChangeEvent :: IsForeign HashChangeEvent where
  read = readHashChangeEvent

foreign import data IDBVersionChangeEvent :: *

idbVersionChangeEventToEvent :: IDBVersionChangeEvent -> Event
idbVersionChangeEventToEvent = unsafeToEvent

readIDBVersionChangeEvent :: Foreign -> F IDBVersionChangeEvent
readIDBVersionChangeEvent = unsafeReadTagged "IDBVersionChangeEvent"

instance isIsForeignIDBVersionChangeEvent :: IsForeign IDBVersionChangeEvent where
  read = readIDBVersionChangeEvent

foreign import data InputEvent :: *

inputEventToEvent :: InputEvent -> Event
inputEventToEvent = unsafeToEvent

readInputEvent :: Foreign -> F InputEvent
readInputEvent = unsafeReadTagged "InputEvent"

instance isIsForeignInputEvent :: IsForeign InputEvent where
  read = readInputEvent

foreign import data KeyboardEvent :: *

keyboardEventToEvent :: KeyboardEvent -> Event
keyboardEventToEvent = unsafeToEvent

readKeyboardEvent :: Foreign -> F KeyboardEvent
readKeyboardEvent = unsafeReadTagged "KeyboardEvent"

instance isIsForeignKeyboardEvent :: IsForeign KeyboardEvent where
  read = readKeyboardEvent

foreign import data MediaStreamEvent :: *

mediaStreamEventToEvent :: MediaStreamEvent -> Event
mediaStreamEventToEvent = unsafeToEvent

readMediaStreamEvent :: Foreign -> F MediaStreamEvent
readMediaStreamEvent = unsafeReadTagged "MediaStreamEvent"

instance isIsForeignMediaStreamEvent :: IsForeign MediaStreamEvent where
  read = readMediaStreamEvent

foreign import data MessageEvent :: *

messageEventToEvent :: MessageEvent -> Event
messageEventToEvent = unsafeToEvent

readMessageEvent :: Foreign -> F MessageEvent
readMessageEvent = unsafeReadTagged "MessageEvent"

instance isIsForeignMessageEvent :: IsForeign MessageEvent where
  read = readMessageEvent

foreign import data MouseEvent :: *

mouseEventToEvent :: MouseEvent -> Event
mouseEventToEvent = unsafeToEvent

readMouseEvent :: Foreign -> F MouseEvent
readMouseEvent = unsafeReadTagged "MouseEvent"

instance isIsForeignMouseEvent :: IsForeign MouseEvent where
  read = readMouseEvent

foreign import data MutationEvent :: *

mutationEventToEvent :: MutationEvent -> Event
mutationEventToEvent = unsafeToEvent

readMutationEvent :: Foreign -> F MutationEvent
readMutationEvent = unsafeReadTagged "MutationEvent"

instance isIsForeignMutationEvent :: IsForeign MutationEvent where
  read = readMutationEvent

foreign import data OfflineAudioCompletionEvent :: *

offlineAudioCompletionEventToEvent :: OfflineAudioCompletionEvent -> Event
offlineAudioCompletionEventToEvent = unsafeToEvent

readOfflineAudioCompletionEvent :: Foreign -> F OfflineAudioCompletionEvent
readOfflineAudioCompletionEvent = unsafeReadTagged "OfflineAudioCompletionEvent"

instance isIsForeignOfflineAudioCompletionEvent :: IsForeign OfflineAudioCompletionEvent where
  read = readOfflineAudioCompletionEvent

foreign import data PageTransitionEvent :: *

pageTransitionEventToEvent :: PageTransitionEvent -> Event
pageTransitionEventToEvent = unsafeToEvent

readPageTransitionEvent :: Foreign -> F PageTransitionEvent
readPageTransitionEvent = unsafeReadTagged "PageTransitionEvent"

instance isIsForeignPageTransitionEvent :: IsForeign PageTransitionEvent where
  read = readPageTransitionEvent

foreign import data PointerEvent :: *

pointerEventToEvent :: PointerEvent -> Event
pointerEventToEvent = unsafeToEvent

readPointerEvent :: Foreign -> F PointerEvent
readPointerEvent = unsafeReadTagged "PointerEvent"

instance isIsForeignPointerEvent :: IsForeign PointerEvent where
  read = readPointerEvent

foreign import data PopStateEvent :: *

popStateEventToEvent :: PopStateEvent -> Event
popStateEventToEvent = unsafeToEvent

readPopStateEvent :: Foreign -> F PopStateEvent
readPopStateEvent = unsafeReadTagged "PopStateEvent"

instance isIsForeignPopStateEvent :: IsForeign PopStateEvent where
  read = readPopStateEvent

foreign import data ProgressEvent :: *

progressEventToEvent :: ProgressEvent -> Event
progressEventToEvent = unsafeToEvent

readProgressEvent :: Foreign -> F ProgressEvent
readProgressEvent = unsafeReadTagged "ProgressEvent"

instance isIsForeignProgressEvent :: IsForeign ProgressEvent where
  read = readProgressEvent

foreign import data RelatedEvent :: *

relatedEventToEvent :: RelatedEvent -> Event
relatedEventToEvent = unsafeToEvent

readRelatedEvent :: Foreign -> F RelatedEvent
readRelatedEvent = unsafeReadTagged "RelatedEvent"

instance isIsForeignRelatedEvent :: IsForeign RelatedEvent where
  read = readRelatedEvent

foreign import data RTCDataChannelEvent :: *

rtcDataChannelEventToEvent :: RTCDataChannelEvent -> Event
rtcDataChannelEventToEvent = unsafeToEvent

readRTCDataChannelEvent :: Foreign -> F RTCDataChannelEvent
readRTCDataChannelEvent = unsafeReadTagged "RTCDataChannelEvent"

instance isIsForeignRTCDataChannelEvent :: IsForeign RTCDataChannelEvent where
  read = readRTCDataChannelEvent

foreign import data RTCIdentityErrorEvent :: *

rtcIdentityErrorEventToEvent :: RTCIdentityErrorEvent -> Event
rtcIdentityErrorEventToEvent = unsafeToEvent

readRTCIdentityErrorEvent :: Foreign -> F RTCIdentityErrorEvent
readRTCIdentityErrorEvent = unsafeReadTagged "RTCIdentityErrorEvent"

instance isIsForeignRTCIdentityErrorEvent :: IsForeign RTCIdentityErrorEvent where
  read = readRTCIdentityErrorEvent

foreign import data RTCIdentityEvent :: *

rtcIdentityEventToEvent :: RTCIdentityEvent -> Event
rtcIdentityEventToEvent = unsafeToEvent

readRTCIdentityEvent :: Foreign -> F RTCIdentityEvent
readRTCIdentityEvent = unsafeReadTagged "RTCIdentityEvent"

instance isIsForeignRTCIdentityEvent :: IsForeign RTCIdentityEvent where
  read = readRTCIdentityEvent

foreign import data RTCPeerConnectionIceEvent :: *

rtcPeerConnectionIceEventToEvent :: RTCPeerConnectionIceEvent -> Event
rtcPeerConnectionIceEventToEvent = unsafeToEvent

readRTCPeerConnectionIceEvent :: Foreign -> F RTCPeerConnectionIceEvent
readRTCPeerConnectionIceEvent = unsafeReadTagged "RTCPeerConnectionIceEvent"

instance isIsForeignRTCPeerConnectionIceEvent :: IsForeign RTCPeerConnectionIceEvent where
  read = readRTCPeerConnectionIceEvent

foreign import data SensorEvent :: *

sensorEventToEvent :: SensorEvent -> Event
sensorEventToEvent = unsafeToEvent

readSensorEvent :: Foreign -> F SensorEvent
readSensorEvent = unsafeReadTagged "SensorEvent"

instance isIsForeignSensorEvent :: IsForeign SensorEvent where
  read = readSensorEvent

foreign import data StorageEvent :: *

storageEventToEvent :: StorageEvent -> Event
storageEventToEvent = unsafeToEvent

readStorageEvent :: Foreign -> F StorageEvent
readStorageEvent = unsafeReadTagged "StorageEvent"

instance isIsForeignStorageEvent :: IsForeign StorageEvent where
  read = readStorageEvent

foreign import data SVGEvent :: *

svgEventToEvent :: SVGEvent -> Event
svgEventToEvent = unsafeToEvent

readSVGEvent :: Foreign -> F SVGEvent
readSVGEvent = unsafeReadTagged "SVGEvent"

instance isIsForeignSVGEvent :: IsForeign SVGEvent where
  read = readSVGEvent

foreign import data SVGZoomEvent :: *

svgZoomEventToEvent :: SVGZoomEvent -> Event
svgZoomEventToEvent = unsafeToEvent

readSVGZoomEvent :: Foreign -> F SVGZoomEvent
readSVGZoomEvent = unsafeReadTagged "SVGZoomEvent"

instance isIsForeignSVGZoomEvent :: IsForeign SVGZoomEvent where
  read = readSVGZoomEvent

foreign import data TimeEvent :: *

timeEventToEvent :: TimeEvent -> Event
timeEventToEvent = unsafeToEvent

readTimeEvent :: Foreign -> F TimeEvent
readTimeEvent = unsafeReadTagged "TimeEvent"

instance isIsForeignTimeEvent :: IsForeign TimeEvent where
  read = readTimeEvent

foreign import data TouchEvent :: *

touchEventToEvent :: TouchEvent -> Event
touchEventToEvent = unsafeToEvent

readTouchEvent :: Foreign -> F TouchEvent
readTouchEvent = unsafeReadTagged "TouchEvent"

instance isIsForeignTouchEvent :: IsForeign TouchEvent where
  read = readTouchEvent

foreign import data TransitionEvent :: *

transitionEventToEvent :: TransitionEvent -> Event
transitionEventToEvent = unsafeToEvent

readTransitionEvent :: Foreign -> F TransitionEvent
readTransitionEvent = unsafeReadTagged "TransitionEvent"

instance isIsForeignTransitionEvent :: IsForeign TransitionEvent where
  read = readTransitionEvent

foreign import data UIEvent :: *

uiEventToEvent :: UIEvent -> Event
uiEventToEvent = unsafeToEvent

readUIEvent :: Foreign -> F UIEvent
readUIEvent = unsafeReadTagged "UIEvent"

instance isIsForeignUIEvent :: IsForeign UIEvent where
  read = readUIEvent

foreign import data UserProximityEvent :: *

userProximityEventToEvent :: UserProximityEvent -> Event
userProximityEventToEvent = unsafeToEvent

readUserProximityEvent :: Foreign -> F UserProximityEvent
readUserProximityEvent = unsafeReadTagged "UserProximityEvent"

instance isIsForeignUserProximityEvent :: IsForeign UserProximityEvent where
  read = readUserProximityEvent

foreign import data WheelEvent :: *

wheelEventToEvent :: WheelEvent -> Event
wheelEventToEvent = unsafeToEvent

readWheelEvent :: Foreign -> F WheelEvent
readWheelEvent = unsafeReadTagged "WheelEvent"

instance isIsForeignWheelEvent :: IsForeign WheelEvent where
  read = readWheelEvent
