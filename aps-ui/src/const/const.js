import { Base64 } from 'js-base64'
export const scope = "server";
export const client_id = "aps"; // fixme 请修改为前端项目对应的资源名
export const client_secret = "aps"; // fixme 请修改为前端项目对应的资源名
export const grant_type = "password";
let baseKey = Base64.encode(client_id)
let passwordKey = Base64.encode('jvs')
export const enCodeKey = baseKey.length == 16 ? baseKey :
  (
    baseKey.length > 16 ?
    // 大于16位截取前16
    (baseKey.slice(0, 16)) :
    // 小于16末尾补0
    (get16LenString(baseKey))
  )
export const enCodePasswordKey = passwordKey.length == 16 ? passwordKey :
  (
    passwordKey.length > 16 ?
    // 大于16位截取前16
    (passwordKey.slice(0, 16)) :
    // 小于16末尾补0
    (get16LenString(passwordKey))
  )

let baseDecode = Base64.encode('jvs')
export const deCodeKey = baseDecode.length == 16 ? baseDecode :
  (
    baseDecode.length > 16 ?
    // 大于16位截取前16
    (baseDecode.slice(0, 16)) :
    // 小于16末尾补0
    (get16LenString(baseDecode))
  )


function get16LenString (str) {
  let len = 16 - str.length
  for(let i = 0; i < len; i++) {
    str += '0'
  }
  return str
}

export const systemRouter = ['/wel/index', '/info/index', '/usermessage']
