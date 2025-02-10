/* eslint-disable jsx-a11y/click-events-have-key-events */
/* eslint-disable jsx-a11y/no-static-element-interactions */
/* eslint-disable react/prop-types */
import { useState } from "react";

export default function Modal({ setOpenModal, submitThread, children }) {

    return (
        <div className="modalWrapper">
            <div
                className="modalBackground"
                onClick={() => {
                    setOpenModal(false);
                }}
            />
            <div className="modalContainer warning-notlogged">
                <div className="titleCloseBtn">
                    <button
                        onClick={() => {
                            setOpenModal(false);
                        }}
                    >
                        X
                    </button>
                </div>

                { children }
                
                <div className="footer">
                    <button
                        onClick={() => {
                            setOpenModal(false);
                        }}
                        id="cancelBtn"
                    >
                        Batal
                    </button>
                    <button onClick={submitThread}>Simpan</button>
                </div>
            </div>
        </div>
    );
}
