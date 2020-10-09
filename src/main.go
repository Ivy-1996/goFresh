package main

import (
	"github.com/gin-gonic/gin"
	"github.com/ivy-1996/goFresh/apis/user"
)

func main() {
	server := gin.Default()
	user.Register(server, "/user")
	server.Run(":8999")
}


