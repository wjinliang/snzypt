package com.dm.example.dto;

/**
 * Created by cgj on 2015/12/13.
 */
public class JstreeState {
    private boolean opened = false;
    private boolean disabled = false;
    private boolean selected = false;

    public boolean isOpened() {
        return opened;
    }

    public void setOpened(boolean opened) {
        this.opened = opened;
    }

    public boolean isDisabled() {
        return disabled;
    }

    public void setDisabled(boolean disabled) {
        this.disabled = disabled;
    }

    public boolean isSelected() {
        return selected;
    }

    public void setSelected(boolean selected) {
        this.selected = selected;
    }
}
