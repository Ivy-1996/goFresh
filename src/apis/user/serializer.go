package user

type loginSerializer struct {
	Username string `json:"username"`
	Password string `json:"password"`
}

type registerSerializer struct {
	Username string `json:"username" binding:"required"`
	Password string `json:"password" binding:"required"`
	Email    string `json:"email" binding:"required,email"`
	Allow    bool   `json:"allow" binding:"required"`
}
