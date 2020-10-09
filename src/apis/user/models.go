package user

type User struct {
	ID         int       `gorm:"column:id;primary_key" json:"id"`
	//CreateTime time.Time `gorm:"column:create_time" json:"create_time"`
	//UpdateTime time.Time `gorm:"column:update_time" json:"update_time"`
	Delflag    int       `gorm:"column:delflag" json:"delflag"`
	Username   string    `gorm:"column:username" json:"username"`
	Password   string    `gorm:"column:password" json:"password"`
	Email      string    `gorm:"column:email" json:"email"`
	Active     int       `gorm:"column:active" json:"active"`
}

// TableName sets the insert table name for this struct type
func (u *User) TableName() string {
	return "tbl_user"
}
