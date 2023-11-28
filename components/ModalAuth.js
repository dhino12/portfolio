export default function ModalAuth({ setCloseModal ,children }) {
    return (
        <div className="modalWrapper">
            <div
                className="modalBackground"
            />
            <div className="modalContainer warning-notlogged">
                <div className="titleCloseBtn">
                    <button
                        onClick={() => {
                            setCloseModal(false);
                        }}
                    >
                        X
                    </button>
                </div>

                { children }
                
                <div className="footer">
                </div>
            </div>
        </div>
    );
}