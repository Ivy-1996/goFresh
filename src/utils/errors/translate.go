package errors

import "github.com/go-playground/validator/v10"

func Translator(err error) map[string]string {

	errData := make(map[string]string, 0)
	if validationErrors, ok := err.(validator.ValidationErrors); ok {
		for _, validationError := range validationErrors {
			key := validationError.StructField()
			value := validationError.ActualTag()
			errData[key] = value
		}
	}
	return errData
}
