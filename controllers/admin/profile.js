const ModelAdmin = require('../../models/admin')
const bcrypt = require('bcrypt')
require('dotenv').config()

const profileAdmin = async (req, res) => {
    try {
        const niu_admin = process.env.niu_admin
        if (niu_admin == '') {
            res.status(403).json({
                success: false,
                message: 'admin not found'
            })
        } else {
            const findAdmin = await ModelAdmin.findByPk(niu_admin)
            if (findAdmin) {
                res.status(200).json({
                    success: true,
                    message: 'Data admin ditemukan',
                    data: findAdmin
                })
            } else {
                res.statu(400).json({
                    success: false,
                    message: 'Data admin tidak ditemukan'
                })
            }
        }
    } catch (error) {
        res.status(500).json({
            success: false,
            message: error
        })
    }

}

const updateProfileAdmin = async (req, res) => {
    try {
        const niu_admin = process.env.niu_admin
        const findAdmin = await ModelAdmin.findByPk(niu_admin)
        if (findAdmin) {
            var update = false
            var update2 = false

            const username = req.body.username || findAdmin.username
            const name = req.body.name || findAdmin.name
            const new_password = req.body.new_password
            const old_password = req.body.old_password

            if (new_password) {
                if (name && name !== findAdmin.name) {
                    const findNamaAdmin = await ModelAdmin.findOne({
                        where: {
                            name: name
                        }
                    })

                    if (findNamaAdmin) {
                        res.status(400).json({
                            success: false,
                            message: 'Nama Admin sudah pernah terdaftar'
                        })
                    } else {
                        if (!old_password) {
                            res.status(400).json({
                                success: false,
                                message: 'Silahkan isi password lama anda'
                            })
                        } else {
                            const passwordAsli = findAdmin.password
                            const passwordMatch = bcrypt.compareSync(old_password, passwordAsli);
                            if (passwordMatch) {
                                update2 = true
                            } else {
                                res.status(400).json({
                                    success: false,
                                    message: 'Password lama anda salah'
                                })
                            }
                        }
                        

                    }
                } else {
                    if (!old_password) {
                        res.status(400).json({
                            success: false,
                            message: 'Silahkan isi password lama anda'
                        })
                    } else {
                        const passwordAsli = findAdmin.password
                        const passwordMatch = bcrypt.compareSync(old_password, passwordAsli);
                        if (passwordMatch) {
                            update2 = true
                        } else {
                            res.status(400).json({
                                success: false,
                                message: 'Password lama anda salah'
                            })
                        }
                    }
                }
            } else {
                if (name && name !== findAdmin.name) {
                    const findNamaAdmin = await ModelAdmin.findOne({
                        where: {
                            name: name
                        }
                    })

                    if (findNamaAdmin) {
                        res.status(400).json({
                            success: false,
                            message: 'Nama Admin sudah pernah terdaftar'
                        })
                    } else {

                        update = true
                    }
                } else {
                    update = true
                }
            }

            if (update) {
                const updateProfile = await ModelAdmin.update({
                    name: name,
                    username: username
                }, {
                    where: {
                        niu_admin: niu_admin
                    }
                })

                if (updateProfile) {
                    res.status(200).json({
                        success: true,
                        message: 'Akun berhasil diperbaharui'
                    })
                } else {
                    res.status(400).json({
                        success: false,
                        message: 'Akun tidak berhasil diperbaharui'
                    })
                }
            } else if (update2) {
                const salt = bcrypt.genSaltSync(10)
                const encryptPass = bcrypt.hashSync(new_password, salt)

                const updateProfile = await ModelAdmin.update({
                    name: name,
                    username: username,
                    password: encryptPass
                }, {
                    where: {
                        niu_admin: niu_admin
                    }
                })

                if (updateProfile) {
                    res.status(200).json({
                        success: true,
                        message: 'Akun berhasil diperbaharui'
                    })
                } else {
                    res.status(400).json({
                        success: false,
                        message: 'Akun tidak berhasil diperbaharui'
                    })
                }
            }
        } else {
            return res.redirect('/loginAdmin')
        }

    } catch (error) {
        res.status(500).json({
            success: false,
            message: error
        })
    }


}


module.exports = {
    profileAdmin,
    updateProfileAdmin
}