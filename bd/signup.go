package bd

import (
	"fmt"

	"github.com/Junior_Jurado/gambituser/models"
	"github.com/Junior_Jurado/gambituser/tools"
	_ "github.com/go-sql-driver/mysql"
)

func SignUp(sign models.SignUp) error {
	fmt.Println("Comienza Registro")

	err := DbConnect()
	if err != nil {
		return err
	}

	defer Db.Close()

	sentencia := "INSERT INTO users (User_Email, User_UUID, User_DateAdd) VALUES ('" +
	sign.UserEmail + "','" + sign.UserUUID + "','" + tools.FechaMySQL() + "')"
	fmt.Println(sentencia)

	_, err = Db.Exec(sentencia)
	if err != nil {
		fmt.Println(err.Error())
		return err
	}

	fmt.Println("Sign Up> Ejecución Exitosa")
	return nil
}
