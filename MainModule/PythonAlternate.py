from __future__ import print_function
import struct
import binascii
from gitlab import Gitlab, CurrentUserKey
from Crypto.PublicKey import RSA
from Crypto.Util.number import long_to_bytes
from Crypto.Util.py3compat import bord, bchr
from socket import gethostname
"""gitlab_utils: TODO: brief description """
__author__ = 'squishy'


def get_token_by_userpass(repo, user, passwd):
    gl = Gitlab(repo, email=user, password=passwd)
    gl.auth()
    return gl.user.private_token


def dump_pubkey(key):
    eb = long_to_bytes(key.e)
    nb = long_to_bytes(key.n)
    if bord(eb[0]) & 0x80:
        eb = bchr(0x00)+eb
    if bord(nb[0]) & 0x80:
        nb = bchr(0x00)+nb
    keyparts = [b'ssh-rsa', eb, nb ]
    keystring = b''.join([struct.pack(">I",len(kp))+kp for kp in keyparts])
    fullkey = b'ssh-rsa ' + binascii.b2a_base64(keystring)[:-1]
    return fullkey.decode('UTF-8')


#def generate_RSA(bits=2048):
#    '''
#    Generate an RSA keypair with an exponent of 65537 in OpenSSH format
#    param: bits The key length in bits
#    Return private key and public key

#    Source: https://gist.github.com/lkdocs/6519378, modified for OpenSSH
#    '''
#    new_key = RSA.generate(bits, e=65537)
#    public_key = dump_pubkey(new_key.publickey())
#    private_key = new_key.exportKey("PEM").decode('UTF-8')
#    return private_key, public_key


def add_private_key(glab):
    private, public = generate_RSA()
    CurrentUserKey(glab, {'title': gethostname() + '_submit', 'key': public}).save()
    return private, public


def get_project_list(glab):
    return [proj.path_with_namespace for proj in glab.projects.list(all=True)]


def get_assignment_project_list(glab):
    sstring = glab.user.name.split()[-1] + glab.user.name.split()[0][0]
    return [proj.path_with_namespace for proj in glab.projects.search(sstring.lower, all=True)]


if __name__ == '__main__':
    token = get_token_by_userpass('http://gitpi.local', 'squishy', 'abcd1234')
    print(token)
    gl2 = Gitlab('http://gitpi.local', token)
    gl2.auth()
    print(gl2.user)
    print('\n'.join(get_project_list(gl2)))
    #private=add_private_key(gl2)
    #print(private)
    #a comment
