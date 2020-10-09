package user

import (
	"github.com/ivy-1996/goFresh/db"
	"time"
)

const userMapperXml = "./mappers/userMapper.xml"

type MapperUser struct {
	GetUserByUsername func(username string) (User, error)                                       `args:"username"`
	GetUserByEmail    func(email string) (User, error)                                          `args:"email"`
	CreateUser        func(username, password, email string, createTime time.Time) (int, error) `args:"username,password,email,createTime"`
}

var userMapper = MapperUser{}

func init() {
	db.RegisterMapper(&userMapper, userMapperXml)
}
