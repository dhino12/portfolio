import { useState } from 'react';
import { pdfjs } from 'react-pdf';
import { Document, Page } from 'react-pdf';
import Modal from './Modal';

pdfjs.GlobalWorkerOptions.workerSrc = `//unpkg.com/pdfjs-dist@${pdfjs.version}/build/pdf.worker.min.js`;

export default function ModalPdf({ pdf, setOpenModal }) {
    const [numPages, setNumPages] = useState();
    const [pageNumber, setPageNumber] = useState(1);

    function onDocumentLoadSuccess({ numPages }) {
        setNumPages(numPages);
    }

    return (
        <Modal
            setOpenModal={setOpenModal}
        >
            <object data={pdf} type="application/pdf" width="100%" height="500px">
                <p>Unable to display PDF file. <a href={pdf} style={{color: 'blueviolet'}}>Download</a> instead.</p>
            </object>
        </Modal>
    );

}