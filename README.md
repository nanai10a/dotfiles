# dotfiles

*but this doesn't only manage dotfiles*

---

## policies

### `etc` (`/etc`)

- link as **hard**
- link **each files**

### `.config` (`$XDG_CONFIG_DIR`)

- link as **symbolic**
- link **root dir**

### `.local/share` (`$XDG_DATA_DIR`)

- link as **symbolic**
- link **each files**
