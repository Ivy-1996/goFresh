package email

import (
	"gopkg.in/gomail.v2"
)

type emailCarrier struct {
	toEmail string
	subject string
	body    string
}

type Config struct {
	Host     string
	Port     int
	User     string
	Password string
}

var emailChan chan *emailCarrier

var emailConfig Config

func NewEmailCarrier(toEmail string, subject string, body string) *emailCarrier {
	return &emailCarrier{toEmail: toEmail, subject: subject, body: body}
}

func SendMail(e *emailCarrier) {
	emailChan <- e
}

func sendMail(e *emailCarrier) error {
	mail := gomail.NewMessage()
	mail.SetHeader("From", emailConfig.User)
	mail.SetHeader("To", []string{e.toEmail}...)
	mail.SetHeader("Subject", e.subject)
	mail.SetBody("text/html", e.body)
	return gomail.NewDialer(emailConfig.Host, emailConfig.Port, emailConfig.User, emailConfig.Password).DialAndSend(mail)
}

// 开启简单的消息队列
func sendMailLoop() {
	for {
		sendMail(<-emailChan)
	}
}

func init() {
	// channel 大小自行配置
	emailChan = make(chan *emailCarrier, 100)
	// todo 读取配置文件
	emailConfig.User = "919624032@qq.com"
	emailConfig.Password = "odntfmavnkeebdhb"
	emailConfig.Port = 25
	emailConfig.Host = "smtp.qq.com"
	go sendMailLoop()
}
