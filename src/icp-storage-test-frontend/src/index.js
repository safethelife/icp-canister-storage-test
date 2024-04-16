import React, { useState } from 'react';
import { Actor, HttpAgent } from '@dfinity/agent';
import { backend } from "../../declarations/icp-storage-test-backend";

function ImageUpload() {
  const backendCanisterId = process.env.CANISTER_ID_ICP_STORAGE_TEST_BACKEND;
  const [image, setImage] = useState('');
  const agent = new HttpAgent();

  const handleFileChange = (e) => {
    const file = e.target.files[0];
    if (file) {
      const reader = new FileReader();
      reader.onload = (upload) => {
        setImage(upload.target.result);
      };
      reader.readAsDataURL(file);
    }
  };

  const handleUpload = async () => {
    if (image) {
      const response = await backend.createFile({
        fileId: 'some-generated-file-id', // Generate or manage file IDs appropriately
        file: { content: image }
      });
      console.log(response); // Handle or display the response
    }
  };

  return (
    <div>
      <input type="file" onChange={handleFileChange} />
      <button onClick={handleUpload}>Upload Image</button>
    </div>
  );
}

export default ImageUpload;
