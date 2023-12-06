package models

import "gorm.io/gorm"

type SmsConfiguration struct {
	ApiKey    string `json:"apiKey"`
	ApiSecret string `json:"ApiSecret"`
	Host      string `json:"host"`
	gorm.Model
}

type EmailConfiguration struct {
	Mail     string `json:"mail"`
	Host     string `json:"host"`
	Port     string `json:"port"`
	Password string `json:"password"`
	Username string `json:"username"`
	gorm.Model
}

type PushNotificationConfiguration struct {
	ApiKey string `json:"apiKey"`
	Host   string `json:"host"`
	Secret string `json:"secret"`
	gorm.Model
}

type SlackConfiguration struct {
	gorm.Model
}

type Configuration struct {
	PartyCode string `json:"partyCode"`
	gorm.Model
}
