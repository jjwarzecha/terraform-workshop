#!/usr/bin/env python3
from cryptography.hazmat.primitives import serialization
from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives.asymmetric import rsa
from codecs import decode
from hashlib import md5
import re



def get_fingerprint(public_key):
    # source: https://github.com/oracle/oci-python-sdk/blob/master/examples/add_API_key.py
    # There should be more error checking here, but to keep the example simple
    # the error checking has been omitted.
    m = md5()

    # Strip out the parts of the key that are not used in the fingerprint
    # computation.
    public_key = public_key.replace(b'-----BEGIN PUBLIC KEY-----\n', b'')
    public_key = public_key.replace(b'\n-----END PUBLIC KEY-----', b'')

    # The key is base64 encoded and needs to be decoded before getting the md5 hash
    decoded_key = decode(public_key, "base64")
    m.update(decoded_key)
    hash = m.hexdigest()

    length = 2
    parts = list(hash[0 + i:length + i] for i in range(0, len(hash), length))
    fingerprint = ":".join(parts)

    return fingerprint


def save_to_file (filename, file_content):
    f = open (filename, 'w')
    f.write (file_content + '\n')
    f.close()
    return filename


def main():
    """ Main entry point of the app """

    # generate private key
    key = rsa.generate_private_key(public_exponent=65537,
                                   key_size=4096, backend=default_backend())

    # get private key in PEM container format
    pem_private = key.private_bytes(encoding=serialization.Encoding.PEM,
                                    format=serialization.PrivateFormat.TraditionalOpenSSL,
                                    encryption_algorithm=serialization.NoEncryption())

    # get public key in PEM format
    pem_public_key = key.public_key().public_bytes(encoding=serialization.Encoding.PEM,
                                                   format=serialization.PublicFormat.SubjectPublicKeyInfo)

    # get public key in OpenSSH format
    ssh_public_key = key.public_key().public_bytes(serialization.Encoding.OpenSSH,
                                                   serialization.PublicFormat.OpenSSH)

    # decode to printable strings
    out_pem_private_key_str = pem_private.decode('utf-8')
    out_pem_public_key_str = pem_public_key.decode('utf-8')
    out_ssh_public_key_str = ssh_public_key.decode('utf-8')

    print('Private RSA key in PEM format: ' + save_to_file("oci_api_key.pem", out_pem_private_key_str))
    print(out_pem_private_key_str)
    print('+++++++++++++++++++++++++++++++++++++++++++++')
    print('Public RSA key in PEM format:' + save_to_file("oci_api_key_public.pem", out_pem_public_key_str))
    print(out_pem_public_key_str)
    print('+++++++++++++++++++++++++++++++++++++++++++++')
    print('Fingerprint:',get_fingerprint(pem_public_key) + save_to_file("oci_api_key_fingerprint", get_fingerprint(pem_public_key)))
    print('+++++++++++++++++++++++++++++++++++++++++++++')
    print('Public RSA key in OpenSSH format:' + (save_to_file("oci_openssh.pub", out_ssh_public_key_str)))
    print(out_ssh_public_key_str)

if __name__ == "__main__":
    """ This is executed when run from the command line """
    main()
