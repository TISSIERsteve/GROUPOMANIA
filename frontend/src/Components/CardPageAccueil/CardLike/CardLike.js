import React from 'react'
import { useEffect, useState } from "react"
import Axios from 'axios';

// CSS
import "./CardLike.css"

// Components pour like image
function CardLike({ idLike }) {
    // console.log(idLike);

    // Afficher les likes images
    const [userlikes, setUserLikes] = useState([]);
    useEffect(
        () => {
            Axios.get(`http://localhost:3001/api/posts/${idLike}`)
                .then(response => {
                    setUserLikes(response.data.result)
                })
                .catch(err => {
                    // console.log(err);
                });
        },
        [idLike]
    );


    // Poster un like image
    const authUser = parseInt(localStorage.id, 10);
    const addLike = (id) => {
        Axios.put(`http://localhost:3001/api/posts/${id}/likeImg`, {
            userId: authUser,
        })
        window.location.reload()
    }

    // Poster un dislike
    const addDisLike = () => {
        console.log("Pas encore fait");
    }
    console.log(userlikes);

    // JSX
    return (
        <div className='like_dislike'>
            <div className='like'>
                <button className='btn_like up' onClick={() => addLike(idLike)}>
                    Up <i className="fas fa-thumbs-up "></i>
                </button>

                {
                    userlikes && userlikes.length
                        ? userlikes.map(x => {
                            if (x.post_id === idLike) {
                                return (
                                    <ul key={x.post_id}>
                                        <li>
                                            {x.likes_id.split(",").length}
                                        </li>
                                    </ul>
                                );
                            } return null
                        })
                        : <li>0 like</li>
                }
            </div>
            <div>

                <button className='btn_like' onClick={addDisLike}>
                    Down <i className="fas fa-thumbs-down down"></i>
                </button>
            </div>
        </div>
    )
}

export default CardLike