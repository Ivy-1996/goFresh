package jwt

import (
	"github.com/dgrijalva/jwt-go"
	"time"
)

const (
	JwtSecretKey    = "BQ51WfevBEMhk8GNfRrxEJJoSVIMIdI4" //jwt校验字符串
	JwtExpireSecond = 3600 * 24 * 7                      //30秒过期
)

// 存储在jwt的数据
type Payload struct {
	UserId int
	Time   time.Time
}

func NewPayload(userId int) *Payload {
	return &Payload{UserId: userId, Time: time.Now()}
}

// 创建jwt字符串
func CreateJwtToken(p *Payload) (string, error) {
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.MapClaims{
		"userId": p.UserId,
		// 添加过期时间
		"exp": time.Now().Add(time.Second * JwtExpireSecond).Unix(),
	})
	return token.SignedString([]byte(JwtSecretKey)) //校验的字符串
}

//校验jwt字符串
func ParseJwtToken(s string) (jwt.MapClaims, error) {
	fn := func(token *jwt.Token) (interface{}, error) {
		return []byte(JwtSecretKey), nil //校验字符串
	}

	result, err := jwt.Parse(s, fn)
	if err != nil {
		return nil, err //signature is invalid or Token is expired
	}
	//解析存入去的jwt信息
	finToken := result.Claims.(jwt.MapClaims)

	return finToken, nil
}
