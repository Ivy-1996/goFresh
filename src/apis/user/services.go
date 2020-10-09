package user

import (
	"errors"
	"fmt"
	"github.com/ivy-1996/goFresh/utils/email"
	"github.com/ivy-1996/goFresh/utils/jwt"
	"time"
)

const (
	RegisterSubject = "欢迎注册天天生鲜"
	Domain          = "http://localhost:8999"
)

func CheckUserExist(username, email string) error {
	user, err := userMapper.GetUserByUsername(username)
	if err != nil {
		return err
	} else if user.ID != 0 {
		return errors.New("用户名已存在")
	}

	user, err = userMapper.GetUserByEmail(email)

	if err != nil {
		return err
	} else if user.ID != 0 {
		return errors.New("邮箱已被使用")
	}
	return nil
}

func CreateUser(username, password, email string) (int, error) {
	password = MakePassWord(password)
	return userMapper.CreateUser(username, password, email, time.Now())
}

func Authenticate(username, password string) (User, error) {
	user, err := userMapper.GetUserByUsername(username)
	if err != nil {
		return user, err
	} else if user.ID == 0 {
		return user, errors.New("用户名或密码错误")
	}
	if !CheckPassword(user, password) {
		return user, errors.New("用户名或密码错误")
	}
	return user, nil
}

func SendRegisterMail(id int, emailAddr string) error {
	token, err := CreateJsonWebToken(id)
	if err != nil {
		return err
	}
	body := fmt.Sprintf(`<h1>欢迎您成为天天生鲜注册会员</h1>请点击下面链接激活您的账户<br/><a href="%s/user/active/%s" style="color: green">点击激活</a>`, Domain, token)
	emailCarrier := email.NewEmailCarrier(emailAddr, RegisterSubject, body)
	email.SendMail(emailCarrier)
	return nil
}

func CreateJsonWebToken(id int) (string, error) {
	payload := jwt.NewPayload(id)
	return jwt.CreateJwtToken(payload)
}
