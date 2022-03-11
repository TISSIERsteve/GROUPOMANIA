import React from "react";
import Axios from "axios";
import { useState, useEffect, useCallback } from "react";

function CardLikeMessage({ idLikeMessage }) {
    // Afficher les likes messages
    const [userlikes, setUserLikes] = useState([]);
    // const [isModify, setisModify] = useState();

    const getLikes = useCallback(
        () => {
            Axios.get(
                `http://localhost:3001/api/messagesPerso/${idLikeMessage}/likes`
            ).then(response => {
                setUserLikes(response.data.result);
            });
            // if (isModify) {
            //     setisModify();
            // } else {
            //     setisModify({ action: false });
            // }
        },
        [idLikeMessage]
    );

    useEffect(
        () => {
            getLikes();
        },
        [getLikes]
    );

    // Poster un like message
    const authUser = parseInt(localStorage.id, 10);

    const addLike = id => {
        Axios.put(`http://localhost:3001/api/messagesPerso/${id}/likeMessage`, {
            userId: authUser
        }).then(() => getLikes());
    };

    // JSX
    return (
        <div className="like_dislike">
            <div className="like">
                <button className="btn_like up" onClick={() => addLike(idLikeMessage)}>
                    {/* <span className={`${isModify ? "action" : ""}`}> */}
                    Up <i className="fas fa-thumbs-up " />
                    {/* </span> */}
                </button>

                {userlikes && userlikes.length
                    ? userlikes.map(x => {
                        if (x.message_perso_id === idLikeMessage) {
                            return (
                                <ul key={x.message_perso_id}>
                                    <li>
                                        {!x.likes_id ? "0" : JSON.parse(x.likes_id).length}
                                    </li>

                                    {/* {x.likes_id.includes([authUser])
                                        ? <p className={` ${isModify}`} ></p>
                                        : <p className={`${setisModify}`}></p>} */}
                                </ul>
                            );
                        }
                        return null;
                    })
                    : <li />}
            </div>
        </div>
    );
}

export default CardLikeMessage;
