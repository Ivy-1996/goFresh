package user

import (
	"github.com/gin-gonic/gin"
	"github.com/ivy-1996/goFresh/utils/errors"
	"log"
)

/*
用户登录
*/
func login(ctx *gin.Context) {
	var serializer loginSerializer

	if err := ctx.BindJSON(&serializer); err != nil {
		errorData := errors.Translator(err)
		ctx.JSON(400, errorData)
		return
	}

	// 校验用户名和密码
	user, err := Authenticate(serializer.Username, serializer.Password)
	if err != nil {
		ctx.JSON(400, gin.H{"errMsg": err.Error(), "success": false})
		return
	}

	// 创建jwt
	token, err := CreateJsonWebToken(user.ID)

	if err != nil {
		log.Println(err.Error())
		ctx.JSON(500, gin.H{"errMsg": "Server Error", "success": false})
		return
	}

	ctx.JSON(200, gin.H{"success": true, "token": token})
}

func register(ctx *gin.Context) {

	var serializer registerSerializer

	if err := ctx.BindJSON(&serializer); err != nil {
		errorData := errors.Translator(err)
		ctx.JSON(400, errorData)
		return
	}
	if err := CheckUserExist(serializer.Username, serializer.Email); err != nil {
		ctx.JSON(400, gin.H{"errMsg": err.Error()})
		return
	}

	userId, err := CreateUser(serializer.Username, serializer.Password, serializer.Email)
	if err != nil {
		ctx.JSON(500, gin.H{"errMsg": err.Error()})
		return
	}
	if err := SendRegisterMail(userId, serializer.Email); err != nil {
		ctx.JSON(500, gin.H{"errMsg": err.Error()})
		return
	}
	ctx.JSON(201, gin.H{"success": true, "msg": "注册成功"})
}
