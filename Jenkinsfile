pipeline {
    agent any
    stages {
        // Paso de aprobación manual
        stage('Aprobacion manual') {
           input {
                message "Esta seguro que desea desplegar a AUTOGESTION?"
                ok "Aprobar"
                parameters {
                   string(name: 'comentario', defaultValue: '', description: 'Deje aquí su comentario')
                }
            }
            steps {
                echo "${Docker}"
            }
        }
        // Paso de compilacion y construcción
       stage('Paso compilación && Subida Docker hub') {
            steps {
                sh "sudo docker-compose up -d --build"
                echo "Terminó de compilar docker file...."
                echo "Logeando a docker"
                sh "sudo docker login -u "alejandrolara95" -p "Alejito95@"

                sh "sudo docker push usuario/project-java:1.0.0 "
            }
        }
    }
}
