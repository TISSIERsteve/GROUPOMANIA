import React from 'react';
import { useState } from "react"
import Axios from 'axios';

// Component pour poster un commentaire sur image page accueil 
function CardCommentOneImage(props) {

    const compte = JSON.parse(localStorage.id)
    const prenom = JSON.parse(localStorage.prenom)
    const commentRegex = /(.*[A-Za-z]){5,30}/;
    const [commentaires, setcommentaires] = useState('')

    // Ouverture fenêtre 
    const [isActive, setisActive] = useState("")
    const handleShow = () => {
        if (isActive === "active") {
            setisActive("")

        } else {
            setisActive("active")
        }
    }

    // Fonction ajout commentaire
    const addCommentImg = () => {
        if (window.confirm(`${prenom} êtes vous sur de vouloir publier votre commentaire`)) {
            addCommentImgDefini()
        } else {
            window.location.reload()
        }
    }

    const addCommentImgDefini = () => {
        if (commentRegex.test(commentaires)) {
            Axios.post("http://localhost:3001/api/contentImg", {
                commentaires,
                compte,
                fk_id_post: props.idy,
            })
                .then(() => {
                    alert(`${prenom} vous venez de commenter `);
                    window.location.reload()
                })
                .catch(err => {
                    alert("Une erreur est survenue, veuillez réessayer");
                });
        } else {
            alert("Veuillez insérer un minimum de 5 caractères")
        }
    }

    // JSX
    return (
        <>
            <p className='boutton_commenter' onClick={handleShow}>Commenter</p>
            <div className={`profilesCommentsInput open ${isActive}`}>
                <label></label>
                <input className="profilesComments"
                    id='commentaires'
                    type="text"
                    placeholder="Commentez l'image"
                    onChange={(event) => {
                        if (commentRegex.test(event.target.value)) {
                            setcommentaires(event.target.value)
                            return
                        }
                    }}
                ></input>

                <button className='btn_modify'>
                    <i className="fas fa-plus-circle valide" onClick={addCommentImg}></i>
                </button>

            </div>
        </>
    )
}

export default CardCommentOneImage;
