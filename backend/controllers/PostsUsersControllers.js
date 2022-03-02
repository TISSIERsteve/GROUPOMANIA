const db = require("../config/mysql")
const fs = require("fs")

// Poster une image sur page accueil
exports.createPost = (req, res, next) => {
    const content = req.body.legende;
    const media_url = `${req.protocol}://${req.get("host")}/images/${req.file.filename}`;

    const media = {
        title: content,
        media_url,
        fk_id_user: req.body.fk_id_user,
        content: req.body.prenom
    }
    console.log(media);

    db.query(
        'INSERT INTO post set ?',
        media,
        (err, result) => {
            if (err) {
                return res.status(403).json({ message: "Accès refusé" })
            } else {
                return res.status(200).json({ message: "Image créer" });
            }
        }
    );
}

// Modifier une image perso sur page perso
exports.updateCommentImg = (req, res, next) => {
    const id = req.params.id
    console.log(id);

    db.query("SELECT * FROM post WHERE fk_id_user = ?",
        [id],
        (err, result) => {
            if (err) {
                return res
                    .status(403)
                    .json({ message: "Accès refusé reception des images(perso)" });
            } else {
                if (result[0].media_url !== "") {
                    const name = result[0].media_url.split("/images/")[1]
                    fs.unlink(`images/${name}`, (error) => {
                        console.log(error);
                    })
                }
            }
        }
    );

    const content = req.body.legende;
    const media_url = `${req.protocol}://${req.get("host")}/images/${req.file.filename}`;

    const media = {
        title: content,
        media_url,
        fk_id_user: req.body.fk_id_user
    }

    db.query(`UPDATE post SET ? WHERE fk_id_user =${id} `,
        [media],
        (err, result) => {
            if (err) {
                return res.status(403).json({ message: "Accés refusé" })
            } else {
                return res.status(200).json({ message: "Image modifié" })
            }
        }
    )
}

// Effacer une image sur page perso
exports.deletePost = (req, res, next) => {
    const persoId = req.params.id;

    // Récupère image dans bdd 
    db.query("SELECT * FROM post WHERE post_id = ?",
        [persoId],
        (err, result) => {
            if (err) {
                return res
                    .status(403)
                    .json({ message: "Accès refusé reception des images(perso)" });
            } else {
                if (result[0].media_url !== "") {
                    const name = result[0].media_url.split("/images/")[1]
                    fs.unlink(`images/${name}`, (error) => {
                        // console.log(error);
                    })
                }
            }
        }
    );

    db.query(
        "DELETE FROM post WHERE post_id = ?",
        [persoId],
        (err, result) => {
            if (err) {
                return res.status(403).json({ message: "Accés refusé" });
            } else {
                return res.status(200).json({ message: "Image supprimée" });
            }
        }
    );
}
