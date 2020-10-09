package db

import (
	_ "github.com/go-sql-driver/mysql"
	"github.com/zhuxiujia/GoMybatis"
	"io/ioutil"
	"log"
	"runtime"
)

var engine GoMybatis.GoMybatisEngine

func RegisterMapper(mapper interface{}, mapperPath string) {
	bytes, err := ioutil.ReadFile(mapperPath)
	if err != nil {
		log.Fatal(err)
	}
	engine.WriteMapperPtr(mapper, bytes)
}

func init() {
	engine = GoMybatis.GoMybatisEngine{}.New()
	db, _ := engine.Open("mysql", "root:qwe123@/goFresh?charset=utf8&parseTime=True&loc=Local")
	db.SetMaxIdleConns(runtime.NumCPU() + 1)
	db.SetMaxOpenConns(runtime.NumCPU()*2 + 1)
}
