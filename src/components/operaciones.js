import React, { useState } from 'react';

const Operaciones = () => {
  const [result, setResult] = useState('');
  const [products, setProducts] = useState([]);

  const handleClick = async () => {
    try {
      const response = await fetch('/api/call-procedure', {
        method: 'POST',
      });

      if (response.ok) {
        const data = await response.json();
        setResult(data.result);
      } else {
        console.error('Error al llamar al procedimiento almacenado');
      }
    } catch (error) {
      console.error('Error en la solicitud:', error);
    }
  };

  const handleSearch = async () => {
    try {
      const response = await fetch('/api/search-products');
      if (response.ok) {
        const data = await response.json();
        setProducts(data.products);
      } else {
        console.error('Error al buscar productos');
      }
    } catch (error) {
      console.error('Error en la solicitud:', error);
    }
  };

  return (
    <div>
      <button
        onClick={handleClick}
        className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded"
      >
        Llamar al procedimiento almacenado
      </button>
      <div className="mt-4">
        Resultado del procedimiento almacenado: <span>{result}</span>
      </div>
      <button
        onClick={handleSearch}
        className="mt-4 bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded"
      >
        Buscar productos
      </button>
      {products.length > 0 && (
        <table className="mt-4 w-full">
          <thead>
            <tr>
              <th className="px-4 py-2">ID</th>
              <th className="px-4 py-2">Nombre</th>
              <th className="px-4 py-2">Descripción</th>
            </tr>
          </thead>
          <tbody>
            {products.map((product) => (
              <tr key={product.product_id}>
                <td className="border px-4 py-2">{product.product_id}</td>
                <td className="border px-4 py-2">{product.product_name}</td>
                <td className="border px-4 py-2">{product.product_description}</td>
              </tr>
            ))}
          </tbody>
        </table>
      )}
    </div>
  );
};

export default Operaciones;