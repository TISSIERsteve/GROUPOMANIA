// const db = require("../config/mysql");

// // =========================================== LIKE =====================================================
// exports.createLike = (req, res) => {
//     db.query("INSERT INTO like set ?", (err, result) => {
//         if (err) {
//             console.log(err);
//             res.status(403).json({ message: "Accès refusé" });

//         } else {
//             if (req.body.like === 1) {
//                 console.log("1 like");
//                 res.status(200).json({ message: "Like Ajouter" });

//             } else if (req.body.like === -1) {
//                 console.log("pas de like");
//                 res.status(200).json({ message: "Enlever like" });
//             }

//             if (req.body.like === 0) {
//                 console.log("j'annule mon like");
//                 res.status(200).json({ message: "Like annuler" });
//             }

//             return res.status(200).json({ message: "Like ajouter" })
//                 .catch(error => {
//                     console.log(error);
//                     return res.status(500).json({ message: "erreur sur le like" });
//                 });
//         }
//     });
// };
