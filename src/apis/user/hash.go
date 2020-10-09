package user

import (
	"crypto/sha256"
	"encoding/hex"
)

func MakePassWord(password string) string {
	hash := sha256.New()
	hash.Write([]byte(password))
	bytes := hash.Sum(nil)
	return hex.EncodeToString(bytes)
}

func CheckPassword(user User, password string) bool {
	return MakePassWord(password) == user.Password
}
