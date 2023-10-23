# Проєктування бази даних

## Модель бізнес-об'єктів

@startuml

    entity User
    entity User.id #FFFFFF
    entity User.username #FFFFFF
    entity User.firstName #FFFFFF
    entity User.lastName #FFFFFF
    entity User.email #FFFFFF
    entity User.password #FFFFFF

    User.username -r-* User
    User.firstName -u-* User
    User.lastName -u-* User
    User.email -u-* User
    User.password -u-* User
    User.id -l-* User

    entity Role
    entity Role.name #FFFFFF
    entity Role.description #FFFFFF
    entity Role.id #FFFFFF

    Role.name -u-* Role
    Role.description -u-* Role
    Role.id -u-* Role

    User "0.*" -d- "1.1" Role

    entity Permission
    entity Permission.name #FFFFFF
    entity Permission.id #FFFFFF

    Permission -d-* Permission.name
    Permission -d-* Permission.id

    Role "0.*" -d- "0.*" Permission

    entity MediaRequest
    entity MediaRequest.id #FFFFFF
    entity MediaRequest.name #FFFFFF
    entity MediaRequest.type #FFFFFF
    entity MediaRequest.keywords #FFFFFF
    entity MediaRequest.description #FFFFFF
    entity MediaRequest.updatedAt #FFFFFF
    entity MediaRequest.createdAt #FFFFFF

    MediaRequest.id -r-* MediaRequest
    MediaRequest.name --* MediaRequest
    MediaRequest.type -u-* MediaRequest
    MediaRequest.keywords -u-* MediaRequest
    MediaRequest.description -u-* MediaRequest
    MediaRequest -u-* MediaRequest.updatedAt
    MediaRequest -u-* MediaRequest.createdAt

    User "1.1" -u- "0.*" MediaRequest

    entity Feedback
    entity Feedback.id #FFFFFF
    entity Feedback.body #FFFFFF
    entity Feedback.rating #FFFFFF
    entity Feedback.createdAt #FFFFFF
    entity Feedback.updatedAt #FFFFFF

    User "1.1" -u- "0.*" Feedback
    MediaRequest "1.1" -r- "0.*" Feedback

    Feedback -r-* Feedback.id
    Feedback -d-* Feedback.body
    Feedback -u-* Feedback.rating
    Feedback -u-* Feedback.createdAt
    Feedback -u-* Feedback.updatedAt

@enduml

## ER-модель

@startuml
    entity User {
        id: Int
        username: Text
        firstName: Text
        lastName: Text
        email: Text
        password: Text
    }

    entity Role {
        id: Int
        name: Text
        description: Text
    }

    entity Permission {
        id: Int
        name: Text
    }

    entity MediaRequest {
        id: Int
        name: Text
        type: Text
        keywords: Text
        description: Text
        updatedAt: Datetime
        createdAt: Datetime
    }

    entity Feedback {
        id: Int
        body: Text
        rating: Float
        updatedAt: Datetime
        createdAt: Datetime
    }

    entity RoleHasPermission {
        roleId: Int
        permissionId: Int
    }

    User "0.*" -d- "1.1" Role
    User "1.1" -u- "0.*" MediaRequest
    User "1.1" -u- "0.*" Feedback
    MediaRequest "1.1" -r- "0.*" Feedback
    Role "1.1" -d "0.*" RoleHasPermission
    Permission "1.1" -u "0.*" RoleHasPermission

@enduml