package main

import "testing"

func TestAdd(t *testing.T) {
    result := add(2, 4)
    expected := 6
    if result != expected {
        t.Errorf("add() test returned an unexpected result: got %v want %v", result, expected)
    }
}