package main

import (
    "testing"
    "net/http"
    "io/ioutil"
    "log"
    "strings"
)

func TestAdd(t *testing.T) {
    result := add(2, 4)
    expected := 6
    if result != expected {
        t.Errorf("add() test returned an unexpected result: got %v want %v", result, expected)
    }
}

func TestPing(t *testing.T) {
    resp, err := http.Get("http://myfirstgoproject:3000/ping")
    if err != nil {
        t.Errorf("http call error: got %v", err)
    }

    defer resp.Body.Close()

    body, err := ioutil.ReadAll(resp.Body)
    if err != nil {
        t.Errorf("body read error: got %v", err)
    }
    log.Printf("received response %v",string(body))

    if !strings.Contains(string(body), "pong") {
        t.Errorf("ping() test returned an unexpected result: we didn't receive a pong response - %v", string(body))
    }
}