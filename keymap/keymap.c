#include QMK_KEYBOARD_H
#include "version.h"

enum nix_layers {
  L_BASE,
  L_GAMES,
  L_LOWER,
  L_RAISE,
  L_ADJUST,
  L_CODE,
  LAYER_COUNT
};

enum custom_keycodes {
  EPRM = SAFE_RANGE,
  CODE,
  VRSN,
  RGB_SLD
};

#define KC_LOWER MO(L_LOWER)
#define KC_RAISE MO(L_RAISE)

#define THUMB_CLUSTER KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS
#define LAYOUT_nix(...) LAYOUT_ergodox(__VA_ARGS__)

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
[L_BASE] = LAYOUT_nix(
  // left hand
  KC_GESC, KC_1      , KC_2  , KC_3  , KC_4  , KC_5, KC_EQL,
  KC_TAB, KC_Q      , KC_W  , KC_E  , KC_R  , KC_T, G(KC_LBRC),
  KC_BSPC, KC_A      , KC_S  , KC_D  , KC_F  , KC_G,
  KC_LSFT, CTL_T(KC_Z), KC_X  , KC_C  , KC_V  , KC_B, G(KC_RBRC),
  KC_LCTL, KC_PSCR   , KC_SLCK, KC_PAUS, KC_LALT,

                                                                 KC_HOME, KC_END,
                                                                          KC_PGUP,
                                              LGUI_T(KC_SPACE), KC_LOWER, KC_PGDN,
  // right hand
  KC_MINS  , KC_6 , KC_7    , KC_8  , KC_9  , KC_0         , KC_BSPC  ,
  G(KC_BSLS), KC_Y , KC_U    , KC_I  , KC_O  , KC_P         , KC_BSLS  ,
  /*       , */KC_H, KC_J    , KC_K  , KC_L  , KC_SCLN      , KC_ENTER ,
  G(KC_MINS), KC_N , KC_M    , KC_COMM, KC_DOT, CTL_T(KC_SLSH), KC_RSFT  ,
  /*       ,      , */KC_QUOT, KC_LBRC, KC_RBRC, KC_GRAVE     , MO(L_CODE),

  LGUI(KC_LEFT), LGUI(KC_RIGHT),
  LGUI(KC_UP),
  LGUI(KC_DOWN), KC_RAISE, KC_SPACE
),

[L_GAMES] = LAYOUT_nix( // left fn
  // left hand
  KC_GESC, KC_1      , KC_2  , KC_3  , KC_4  , KC_5, KC_EQL,
  KC_TAB, KC_Q      , KC_W  , KC_E  , KC_R  , KC_T, G(KC_LBRC),
  KC_BSPC, KC_A      , KC_S  , KC_D  , KC_F  , KC_G,
  KC_LSFT, CTL_T(KC_Z), KC_X  , KC_C  , KC_V  , KC_B, G(KC_RBRC),
  KC_LCTL, KC_PSCR   , KC_SLCK, KC_PAUS, KC_LALT,

                                                          KC_HOME, KC_END,
                                                                  KC_PGUP,
                                              KC_SPACE, KC_LOWER, KC_PGDN,
  // right hand
  KC_MINS  , KC_6 , KC_7    , KC_8  , KC_9  , KC_0         , KC_BSPC  ,
  G(KC_BSLS), KC_Y , KC_U    , KC_I  , KC_O  , KC_P         , KC_BSLS  ,
  /*       , */KC_H, KC_J    , KC_K  , KC_L  , KC_SCLN      , KC_ENTER ,
  G(KC_MINS), KC_N , KC_M    , KC_COMM, KC_DOT, CTL_T(KC_SLSH), KC_RSFT  ,
  /*       ,      , */KC_QUOT, KC_LBRC, KC_RBRC, KC_GRAVE     , MO(L_CODE),

  LGUI(KC_LEFT), LGUI(KC_RIGHT),
  LGUI(KC_UP),
  LGUI(KC_DOWN), KC_RAISE, KC_SPACE
),

[L_LOWER] = LAYOUT_nix( // left fn
  // left hand
  KC_GRAVE, _______, _______, _______, _______, _______, _______,
  _______, _______, _______, _______, _______, _______, _______,
  _______, _______, _______, _______, _______, _______,
  KC_RSFT, _______, _______, _______, _______, _______, _______,
  KC_RCTL, _______, _______, _______, KC_RALT,

                                               _______, _______,
                                                        _______,
                                      _______, KC_LOWER, KC_MINS,

  // right hand
  _______, _______, _______, _______, KC_MINS, KC_EQL,  KC_DEL,
  _______, _______, KC_7,    KC_8,    KC_9,    KC_ASTR, _______,
  /******/ _______, KC_4,    KC_5,    KC_6,    KC_PLUS, _______,
  _______, _______, KC_1,    KC_2,    KC_3,    KC_BSLS, _______,
  /***************/ KC_0,    KC_0,    KC_DOT,  _______, _______,

  KC_TRNS, KC_TRNS,
  KC_TRNS,
  KC_TRNS, KC_TRNS, KC_MINUS
),

[L_RAISE] = LAYOUT_nix( // right fn
  // left hand
  KC_GRAVE, KC_F1,  KC_F2,  KC_F3, KC_F4,  KC_F5, _______,
  KC_TRNS,  KC_F6,  KC_F7,  KC_F8, KC_F9,  KC_F10, _______,
  KC_TRNS, KC_F11, KC_F12, KC_F13, KC_F14, KC_F15,
  KC_TRNS, KC_F16, KC_F17, KC_F18, KC_F19, KC_F20, _______,
  KC_RCTL, _______, _______, _______, KC_RALT,

                                               _______, _______,
                                                        _______,
                                      KC_LGUI, _______, _______,
  // right hand
  _______, _______ , _______ , _______, KC_MINS,  KC_EQL, KC_DEL,
  _______, _______ , _______ , _______, _______, _______, _______,
  /*    , */KC_LEFT, KC_DOWN ,   KC_UP, KC_RGHT, _______, _______,
  _______, _______ , _______ , _______, _______, _______, _______,
  /*    ,         , */_______, _______, _______, _______, _______,

  KC_TRNS, KC_TRNS,
  KC_TRNS,
  KC_TRNS, KC_TRNS, KC_MINUS
),


[L_ADJUST] = LAYOUT_nix( // both fn
  // left hand
  _______, _______, _______, _______, _______, _______, RGB_MOD,
  _______, _______, _______, _______, _______, _______, RGB_HUD,
  _______, _______, _______, _______, _______, _______,
  _______, _______, _______, _______, _______, _______, RGB_SAD,
  _______, _______, _______, _______, _______,
  
                                               _______, _______,
                                                        _______,
                                      _______, _______, _______,

  // right hand
  RGB_RMOD, _______ , _______ , _______, _______, _______, KC_INS,
  RGB_HUI, _______ , _______ , _______, _______, _______, _______,
  /*     , */KC_HOME, KC_PGDN , KC_PGUP, KC_END, _______, _______,
  RGB_SAI, _______ , _______ , _______, _______, _______, _______,
  /*     ,         , */_______, _______, _______, _______, RESET ,
  
  _______, _______,
  _______,
  _______, _______, _______
),

[L_CODE] = LAYOUT_nix( // code button
  // left hand
  KC_ESC, KC_BTN1, KC_BTN2, KC_BTN3, KC_BTN4, KC_BTN5, _______,
  _______, KC_BTN2, KC_MS_U, KC_BTN1, KC_WH_U, _______, DF(L_BASE),
  _______, KC_MS_L, KC_MS_D, KC_MS_R, KC_WH_D, TG(L_GAMES),
  KC_ACL2, KC_ACL0, KC_WH_L, KC_WH_R, _______, _______, DF(L_GAMES),
  KC_ACL1, _______, _______, _______, _______,
  
                                               _______, _______,
                                                        _______,
                                      _______, _______, _______,

  // right hand
  _______, _______ , _______ , _______, _______, _______, RGB_TOG,
  RGB_MOD, _______ , _______ , _______, _______, _______, _______,
  /*    , */_______, _______ , _______, _______, KC_LOCK, _______,
  RGB_RMOD, _______ , _______ , KC_MPRV, KC_MNXT, _______, _______,
  /*    ,         , */KC_VOLU, KC_VOLD, KC_MUTE, _______, _______,
  
  RGB_HUD, RGB_HUI,
  RGB_SAI,
  RGB_SAD, _______, _______
),
};

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
  if (record->event.pressed) {
    switch (keycode) {
      case EPRM:
        eeconfig_init();
        return false;
      case VRSN:
        SEND_STRING (QMK_KEYBOARD "/" QMK_KEYMAP " @ " QMK_VERSION);
        return false;
      #ifdef RGBLIGHT_ENABLE
      case RGB_SLD:
        rgblight_mode(1);
        return fase;
      #endif
    }
  }
  return true;
}

// Runs just one time when the keyboard initializes.
void matrix_init_user(void) {
#ifdef RGBLIGHT_COLOR_LAYER_0
  rgblight_setrgb(RGBLIGHT_COLOR_LAYER_0);
#endif
};

// Runs whenever there is a layer state change.
uint32_t layer_state_set_user(uint32_t state) {
  return update_tri_layer_state(state, L_LOWER, L_RAISE, L_ADJUST);
};
