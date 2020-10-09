package user

import "github.com/gin-gonic/gin"

func Register(engine *gin.Engine, path string) {
	router := engine.Group(path)
	router.POST("/login", login)
	router.POST("/register", register)
	//router.GET("/active/:token", active)
}
