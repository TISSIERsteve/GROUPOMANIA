import React from 'react'

// CSS
import "./CardLike.css"

// Compnents pour like
function CardLike() {

    const addLike = () => {
        console.log("yes");
    }

    // JSX
    return (
        <div className='like_dislike'>
            <div>

                <button className='btn_like up' onClick={addLike}>
                    Up <i className="fas fa-thumbs-up "></i>
                </button>
            </div>
            <div>

                <button className='btn_like'>
                    Down <i className="fas fa-thumbs-down down"></i>
                </button>
            </div>
        </div>
    )
}

export default CardLike