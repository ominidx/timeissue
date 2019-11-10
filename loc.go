package main

import (
	"fmt"
	"log"
	"time"
)

func main() {
	layout := "2006-01-02"
	location, err := time.LoadLocation("Asia/Kolkata")
	if err != nil {
		log.Println("LoadLocation(Asia/Kolkata) error", err)
		panic(err)
	}
	tm := time.Now().In(location)
	fmt.Println(tm.Format(layout))
	<-time.After(time.Duration(time.Hour))
}
