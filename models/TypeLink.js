//Importaciones necesarias
const sequelize = require('../database/config');
const Sequelize = require('sequelize');

const TypeLink = sequelize.define('TypeLink', {
    // atributos
    IDTypeLink: {
        type: Sequelize.STRING,
        allowNull: false,
        primaryKey: true,  //se establece que es la clave primaria de la tabla
        unique: true
    },
    nameTypeLink: {
        type: Sequelize.STRING,
        allowNull: false
    },
    }, {
        timestamps: false,
        freezeTableName: true, 
    }
    );
    
    async () => {
        await TypeLink.sync({ /*force: true*/ }) /* al colocar force:true, vuelve a crear la tabla a pesar de que ya esté creada, es decir, la tabla se elimina y se vuelve a crear*/
    }

    module.exports = TypeLink;

    